import 'dart:convert';

import 'package:homeward_server/development/development_environment.dart';
import 'package:homeward_server/development/development_handler.dart';
import 'package:homeward_server/development/dotenv.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

void main() {
  test('a dotenv file gives its assignments, unquoted, and skips the rest', () {
    expect(
      parseDotenv('''
# keys
HOMEWARD_EVAL_GEMINI_KEY=abc
QUOTED="two words"
EMPTY=

not an assignment
'''),
      {
        'HOMEWARD_EVAL_GEMINI_KEY': 'abc',
        'QUOTED': 'two words',
        'EMPTY': '',
      },
    );
  });

  test('a development run reads the dotenv file beside the environment', () {
    final environment = developmentEnvironment(
      {'PORT': '9000'},
      dotenv: 'CEREBRAS_API_KEY=secret',
    );

    expect(environment['CEREBRAS_API_KEY'], 'secret');
    expect(environment['PORT'], '9000');
  });

  test('the environment beats the dotenv file', () {
    final environment = developmentEnvironment(
      {'A': 'process'},
      dotenv: 'A=file',
    );

    expect(environment['A'], 'process');
  });

  group('the development config', () {
    final handler = developmentHandler({
      'HOMEWARD_EVAL_GEMINI_KEY': ' first ',
      'HOMEWARD_EVAL_GEMINI_MOON_KEY': '',
      'CEREBRAS_API_KEY': 'not for the app',
    });

    Future<Response> ask(String host) =>
        Future.value(handler(Request('GET', Uri.parse('http://$host/config'))));

    test('gives the app the Gemini keys and nothing else', () async {
      final response = await ask('localhost:8080');

      expect(response.statusCode, 200);
      expect(jsonDecode(await response.readAsString()), {
        'geminiKeys': ['first'],
      });
    });

    test('is not there for a request that is not for this machine', () async {
      expect((await ask('192.168.1.20:8080')).statusCode, 404);
      expect((await ask('evil.example')).statusCode, 404);
    });
  });
}
