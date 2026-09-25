import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

final class DevelopmentServerFailed implements Exception {
  const DevelopmentServerFailed(this.logPath);

  final String logPath;

  @override
  String toString() => 'The development server did not come up; see $logPath';
}

final class DevelopmentServer {
  DevelopmentServer({http.Client? client, Directory? root, this.port = 8080})
    : _client = client ?? http.Client(),
      _root = root ?? Directory.current;

  final int port;
  final http.Client _client;
  final Directory _root;

  Uri get url => Uri.parse('http://localhost:$port');

  File get log => File('${_root.path}/.dart_tool/homeward/server.log');

  File get _started => File('${_root.path}/.dart_tool/homeward/server.started');

  Future<bool> get isUp async {
    try {
      final response = await _client
          .get(url.resolve('/health'))
          .timeout(const Duration(seconds: 2));
      return response.statusCode == 200;
    } on Object {
      return false;
    }
  }

  Future<void> start() async {
    if (await isUp) {
      return;
    }
    log.parent.createSync(recursive: true);
    await Process.start(
      '/bin/sh',
      [
        '-c',
        'exec dart run --enable-vm-service server/tool/dev.dart '
            '> "${log.path}" 2>&1',
      ],
      workingDirectory: _root.path,
      mode: ProcessStartMode.detached,
    );
    _started.writeAsStringSync('');
    final deadline = DateTime.now().add(const Duration(seconds: 120));
    while (!await isUp) {
      if (DateTime.now().isAfter(deadline)) {
        throw DevelopmentServerFailed(log.path);
      }
      await Future<void>.delayed(const Duration(milliseconds: 500));
    }
  }

  Future<void> stop() async {
    if (!_started.existsSync()) {
      return;
    }
    _started.deleteSync();
    final listeners = await Process.run('lsof', [
      '-t',
      '-i',
      'tcp:$port',
      '-sTCP:LISTEN',
    ]);
    for (final line in (listeners.stdout as String).split('\n')) {
      if (int.tryParse(line.trim()) case final pid?) {
        Process.killPid(pid);
      }
    }
  }
}
