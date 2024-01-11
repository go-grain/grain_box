import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class GLog {
  static final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  static void debug(dynamic message) {
    logger.d(message);
  }

  static void info(dynamic message) {
    if (kReleaseMode) {
    } else {
      logger.i(message);
    }
  }

  static void warning(dynamic message) {
    logger.w(message);
  }

  static void error(dynamic message, [dynamic error]) {
    logger.e(message, error: error);
  }
}
