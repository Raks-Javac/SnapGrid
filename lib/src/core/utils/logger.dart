part of "utils.dart";

class Logger {
  static void logInfo(dynamic message) {
    _log('INFO', message);
  }

  static void logError(dynamic message) {
    _log('ERROR', message);
  }

  static void _log(String level, dynamic message) {
    String logMessage = '$level: $message';
    debugPrint(logMessage);
    // You can also save the logMessage to a file or send it to a remote logging service
  }
}
