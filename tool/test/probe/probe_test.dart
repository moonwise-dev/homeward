import 'dart:io';

import 'package:homeward_tool/probe/describe_event.dart';
import 'package:homeward_tool/probe/firebase_web_api_key.dart';
import 'package:homeward_tool/probe/gemini_keys.dart';
import 'package:homeward_tool/probe/probe_surfaces.dart';
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
            {
              'id': 'income',
              'component': 'MoneyInput',
              'value': {'path': '/profile/netMonthlyIncome'},
              'action': {
                'event': {'name': 'commit_profile'},
              },
            },
          ],
        },
      }),
      'components t1-profile:\n'
      '  root: Column\n'
      '  income: MoneyInput value=/profile/netMonthlyIncome action=commit_profile',
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

  test('takes the keys from the environment, trimmed', () {
    expect(GeminiKeys.fromEnvironment({}), isNull);
    expect(
      GeminiKeys.fromEnvironment({'HOMEWARD_EVAL_GEMINI_KEY': ' '}),
      isNull,
    );
    expect(
      GeminiKeys.fromEnvironment({
        'HOMEWARD_EVAL_GEMINI_MOON_KEY': ' moon ',
      })?.current,
      'moon',
    );
  });

  test('moves to the next key only when a quota is exhausted', () {
    final keys = GeminiKeys.fromEnvironment({
      'HOMEWARD_EVAL_GEMINI_KEY': 'first',
      'HOMEWARD_EVAL_GEMINI_MOON_KEY': 'moon',
    })!;
    const exhausted = 'gemini_quota_exhausted';

    expect(keys.moveOnAfter(null), isFalse);
    expect(keys.moveOnAfter('gemini_key_invalid'), isFalse);
    expect(keys.current, 'first');
    expect(keys.moveOnAfter(exhausted), isTrue);
    expect(keys.current, 'moon');
    expect(keys.moveOnAfter(exhausted), isFalse);
    expect(keys.current, 'moon');
  });

  test('builds an action from the last surface that offers it', () {
    final surfaces = ProbeSurfaces()
      ..record({
        'updateDataModel': {
          'surfaceId': 't1-profile',
          'path': '/profile',
          'value': {'adults': 2, 'borrowers': 2},
        },
      })
      ..record({
        'updateDataModel': {
          'surfaceId': 't1-profile',
          'path': '/selection',
          'value': {'marketId': 'SE'},
        },
      })
      ..record({
        'updateComponents': {
          'surfaceId': 't1-profile',
          'components': [
            {
              'id': 'save',
              'component': 'Button',
              'action': {
                'event': {
                  'name': 'commit_profile',
                  'context': {
                    'profilePath': '/profile',
                    'marketId': {'path': '/selection/marketId'},
                  },
                },
              },
            },
          ],
        },
      });

    final found = surfaces.actionFor('commit_profile', {
      'profile': {'age': 34},
    })!;

    expect(found.action.surfaceId, 't1-profile');
    expect(found.action.sourceComponentId, 'save');
    expect(found.action.context, {'profilePath': '/profile', 'marketId': 'SE'});
    expect(found.surfaceData['profile'], {
      'adults': 2,
      'borrowers': 2,
      'age': 34,
    });
    expect(surfaces.actionFor('commit_scenario', const {}), isNull);
  });
}
