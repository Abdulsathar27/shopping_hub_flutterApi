class AppLogger {
  /// General log
  static void log(String message) {
    // ignore: avoid_print
    print("💬 LOG: $message");
  }

  /// Success log
  static void success(String message) {
    // ignore: avoid_print
    print("✅ SUCCESS: $message");
  }

  /// Warning log
  static void warning(String message) {
    // ignore: avoid_print
    print("⚠️ WARNING: $message");
  }

  /// Error log
  static void error(String message, {Object? error}) {
    // ignore: avoid_print
    print("⛔ ERROR: $message");
    if (error != null) {
      // ignore: avoid_print
      print("DETAIL: $error");
    }
  }
}
