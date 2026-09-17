import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_tool/markets_check/check_markets.dart';
import 'package:homeward_server/markets/finding.dart';
import 'package:homeward_server/markets/load_markets.dart';

void main(List<String> arguments) {
  final root = Directory(arguments.isEmpty ? 'markets' : arguments.single);
  final today = CalendarDate.parse(
    DateTime.now().toUtc().toIso8601String().substring(0, 10),
  );
  final findings = checkMarkets(loadMarkets(root), today: today);
  for (final finding in findings) {
    stdout.writeln(
      '${finding.severity.name} ${finding.subject}: ${finding.message}',
    );
  }
  final errors = findings
      .where((finding) => finding.severity == FindingSeverity.error)
      .length;
  stdout.writeln(
    'markets-check: $errors errors, ${findings.length - errors} warnings',
  );
  exitCode = errors == 0 ? 0 : 1;
}
