import 'package:flutter/foundation.dart';

const kServerUrl = String.fromEnvironment(
  'HOMEWARD_SERVER_URL',
  defaultValue: 'http://localhost:8080',
);

const kRecaptchaSiteKey = '6LdSUL8tAAAAAB5vqNCPVjeRWmE8nvwNDSg8QSg3';

const kAppCheckDebugToken = String.fromEnvironment(
  'HOMEWARD_APP_CHECK_DEBUG_TOKEN',
);

const kDevelopmentGeminiKeys = kReleaseMode
    ? ''
    : String.fromEnvironment('HOMEWARD_DEV_GEMINI_KEYS');

const kGeminiKeyUrl = 'https://aistudio.google.com/apikey';
