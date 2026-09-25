import 'dart:convert';
import 'dart:io';

Future<List<String>> forwardPort(int port, {String? device}) async {
  final ProcessResult listing;
  try {
    listing = await Process.run('adb', ['devices']);
  } on ProcessException {
    return const [];
  }
  final forwarded = <String>[];
  for (final line in LineSplitter.split(listing.stdout as String)) {
    final columns = line.trim().split(RegExp(r'\s+'));
    if (columns.length == 2 &&
        columns[1] == 'device' &&
        (device == null || columns[0] == device)) {
      await Process.run('adb', [
        '-s',
        columns[0],
        'reverse',
        'tcp:$port',
        'tcp:$port',
      ]);
      forwarded.add(columns[0]);
    }
  }
  return forwarded;
}
