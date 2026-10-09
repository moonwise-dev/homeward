import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:json_annotation/json_annotation.dart';

import 'finding.dart';
import 'markets_data.dart';

MarketsData loadMarkets(Directory root) {
  final findings = <Finding>[];
  T? parse<T>(File file, T Function(Object? json) read) {
    try {
      return read(jsonDecode(file.readAsStringSync()));
    } on CheckedFromJsonException catch (error) {
      findings.add(
        findingError(
          file.path,
          '${error.className}.${error.key}: ${error.innerError ?? error.message}',
        ),
      );
    } on FormatException catch (error) {
      findings.add(findingError(file.path, error.message));
    } on TypeError catch (error) {
      findings.add(findingError(file.path, 'Unexpected JSON shape: $error'));
    }
    return null;
  }

  final packsByFile = <String, MarketRulePack>{};
  for (final file in _jsonFiles(Directory('${root.path}/packs'))) {
    final pack = parse(
      file,
      (json) => MarketRulePack.fromJson(json! as Map<String, Object?>),
    );
    if (pack != null) {
      packsByFile[_stem(file)] = pack;
    }
  }

  final rates = <String, ReferenceRate>{};
  for (final file in _jsonFiles(Directory('${root.path}/rates'))) {
    final snapshots = parse(
      file,
      (json) => [
        for (final entry in json! as List<Object?>)
          ReferenceRate.fromJson(entry! as Map<String, Object?>),
      ],
    );
    for (final rate in snapshots ?? const <ReferenceRate>[]) {
      if (rates.containsKey(rate.id)) {
        findings.add(
          findingError(file.path, 'Rate ${rate.id} is defined twice'),
        );
      }
      rates[rate.id] = rate;
    }
  }

  final exchangeRates = <ExchangeRateTable>[];
  for (final file in _jsonFiles(Directory('${root.path}/fx'))) {
    final table = parse(
      file,
      (json) => ExchangeRateTable.fromJson(json! as Map<String, Object?>),
    );
    if (table != null) {
      exchangeRates.add(table);
    }
  }

  final livingCosts = <CountryCode, LivingCosts>{};
  for (final file in _jsonFiles(Directory('${root.path}/living_costs'))) {
    final costs = parse(
      file,
      (json) => LivingCosts.fromJson(json! as Map<String, Object?>),
    );
    if (costs != null) {
      try {
        livingCosts[CountryCode.parse(_stem(file))] = costs;
      } on FormatException {
        findings.add(
          findingError(
            file.path,
            'Living cost files are named by country code',
          ),
        );
      }
    }
  }

  final incomeTax = <CountryCode, IncomeTaxTable>{};
  for (final file in _jsonFiles(Directory('${root.path}/income_tax'))) {
    final table = parse(
      file,
      (json) => IncomeTaxTable.fromJson(json! as Map<String, Object?>),
    );
    if (table != null && !table.isReadable) {
      findings.add(
        findingError(
          file.path,
          'An income tax table needs two points and a rate above the last',
        ),
      );
    } else if (table != null) {
      try {
        incomeTax[CountryCode.parse(_stem(file))] = table;
      } on FormatException {
        findings.add(
          findingError(
            file.path,
            'Income tax files are named by country code',
          ),
        );
      }
    }
  }

  final cities = <String, ListingInventory>{};
  for (final file in _jsonFiles(Directory('${root.path}/listings'))) {
    final inventory = parse(
      file,
      (json) => ListingInventory.fromJson(json! as Map<String, Object?>),
    );
    if (inventory != null) {
      cities[inventory.cityId] = inventory;
    }
  }

  return (
    packsByFile: packsByFile,
    rates: rates,
    exchangeRates: exchangeRates,
    livingCosts: livingCosts,
    incomeTax: incomeTax,
    cities: cities,
    loadFindings: findings,
  );
}

Iterable<File> _jsonFiles(Directory directory) => directory.existsSync()
    ? (directory
          .listSync()
          .whereType<File>()
          .where(
            (file) => file.path.endsWith('.json'),
          )
          .toList()
        ..sort((a, b) => a.path.compareTo(b.path)))
    : const [];

String _stem(File file) {
  final name = file.uri.pathSegments.last;
  return name.substring(0, name.length - '.json'.length);
}
