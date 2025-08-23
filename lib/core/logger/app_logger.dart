import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

enum LogLevel { debug, info, warning, error }

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  static Logger get logger => _logger;

  void log(
    String message, {
    LogLevel level = LogLevel.debug,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!kDebugMode) return; // Only log in debug mode

    switch (level) {
      case LogLevel.debug:
        _logger.d(message, error: error, stackTrace: stackTrace);
        break;
      case LogLevel.info:
        _logger.i(message, error: error, stackTrace: stackTrace);
        break;
      case LogLevel.warning:
        _logger.w(message, error: error, stackTrace: stackTrace);
        break;
      case LogLevel.error:
        _logger.e(message, error: error, stackTrace: stackTrace);
        break;
    }
  }

  void debug(String message, {Object? error, StackTrace? stackTrace}) {
    log(message, level: LogLevel.debug, error: error, stackTrace: stackTrace);
  }

  void info(String message, {Object? error, StackTrace? stackTrace}) {
    log(message, level: LogLevel.info, error: error, stackTrace: stackTrace);
  }

  void warning(String message, {Object? error, StackTrace? stackTrace}) {
    log(message, level: LogLevel.warning, error: error, stackTrace: stackTrace);
  }

  void error(String message, {Object? error, StackTrace? stackTrace}) {
    log(message, level: LogLevel.error, error: error, stackTrace: stackTrace);
  }
}
