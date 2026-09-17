import 'dart:io';

import 'package:homeward_tool/catalog/check_catalog.dart';

void main(List<String> arguments) {
  final root = Directory(arguments.isEmpty ? '.' : arguments.single);
  final findings = checkCatalog(root);
  for (final finding in findings) {
    stdout.writeln(
      '${finding.severity.name} ${finding.subject}: ${finding.message}',
    );
  }
  stdout.writeln('catalog-check: ${findings.length} errors');
  exitCode = findings.isEmpty ? 0 : 1;
}
