import 'dart:io';

import 'package:homeward_tool/dev/android_bridge.dart';
import 'package:homeward_tool/dev/development_server.dart';

Future<void> main(List<String> arguments) async {
  final server = DevelopmentServer();
  try {
    switch (arguments) {
      case ['app', ...final rest]:
        exitCode = await _runApp(server, rest.firstOrNull ?? 'chrome');
      case ['server']:
        await _start(server);
      case ['stop']:
        await server.stop();
      case _:
        stderr.writeln(
          'Usage: dev app [device]  run the app, starting the server first\n'
          '       dev server        start the server in the background\n'
          '       dev stop          stop a server that dev started',
        );
        exitCode = 64;
    }
  } on DevelopmentServerFailed catch (failure) {
    stderr.writeln(failure);
    exitCode = 1;
  }
}

Future<void> _start(DevelopmentServer server, {String? device}) async {
  final wasUp = await server.isUp;
  await server.start();
  stdout.writeln(
    wasUp
        ? 'Development server already running at ${server.url}'
        : 'Development server started at ${server.url}; log in ${server.log.path}',
  );
  for (final forwarded in await forwardPort(server.port, device: device)) {
    stdout.writeln('Forwarded localhost:${server.port} on $forwarded');
  }
}

Future<int> _runApp(DevelopmentServer server, String device) async {
  await _start(server, device: device);
  final signals = [
    for (final signal in [ProcessSignal.sigint, ProcessSignal.sigterm])
      signal.watch().listen((_) {}),
  ];
  try {
    final flutter = await Process.start(
      'flutter',
      ['run', '-d', device],
      workingDirectory: 'app',
      mode: ProcessStartMode.inheritStdio,
    );
    return await flutter.exitCode;
  } finally {
    for (final signal in signals) {
      await signal.cancel();
    }
    await server.stop();
  }
}
