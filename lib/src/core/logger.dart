import 'package:logger/logger.dart' as log;

class Logger {
  static void logException(Exception? exception) {
    try {
      if (exception == null) return;
      var exceptionMessage = exception.toString();
      log.Logger logger = log.Logger();
      logger.e(exceptionMessage);
      // TODO: Send errors here
    } on Exception catch (_) {
      rethrow;
    }
  }
}
