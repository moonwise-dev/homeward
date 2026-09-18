abstract final class AppRoutes {
  static const startup = '/startup';
  static const geminiKey = '/key';
  static const plans = '/plans';
  static const gallery = '/gallery';
  static const wire = '/wire';
  static const plan = '/plans/:sessionId';

  static String planOf(String sessionId) => '/plans/$sessionId';
}
