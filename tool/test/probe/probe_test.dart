import 'dart:io';

import 'package:homeward_tool/probe/describe_event.dart';
import 'package:homeward_tool/probe/firebase_web_api_key.dart';
import 'package:test/test.dart';

void main() {
  test('describes A2UI messages without their values', () {
    expect(
      describeA2uiMessage({
        'version': 'v0.9',
        'updateComponents': {
          'surfaceId': 't1-profile',
          'components': [
            {'id': 'root', 'component': 'Column'},
            {'id': 'income', 'component': 'MoneyInput'},
          ],
        },
      }),
      'components t1-profile: Column, MoneyInput',
    );
    expect(
      describeA2uiMessage({
        'updateDataModel': {
          'surfaceId': 't1-profile',
          'path': '/profile',
          'value': {'age': 34},
        },
      }),
      'seed t1-profile /profile',
    );
  });

  test('reads the web API key from the generated Firebase options', () {
    final directory = Directory.systemTemp.createTempSync('probe');
    addTearDown(() => directory.deleteSync(recursive: true));
    final file = File('${directory.path}/firebase_options.dart')
      ..writeAsStringSync('''
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'android-key',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'web-key',
    appId: '1:1:web:1',
  );
''');

    expect(firebaseWebApiKey(file), 'web-key');
  });
}
