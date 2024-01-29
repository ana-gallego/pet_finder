import 'package:logger/logger.dart';

final logger = AppLogger();

class AppLogger extends Logger {
  final _logger = Logger(
    level: Level.all,
    printer: PrettyPrinter(
      methodCount: 0,
      noBoxingByDefault: true,
      printEmojis: false,
    ),
  );

  ///
  @override
  void t(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.t(message, time: time, error: error, stackTrace: stackTrace);
  }

  @override
  void d(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.d(message, time: time, error: error, stackTrace: stackTrace);
  }

  @override
  void i(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.d(message, time: time, error: error, stackTrace: stackTrace);
  }

  @override
  void w(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.w(message, time: time, error: error, stackTrace: stackTrace);
  }

  @override
  void e(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.e(message, time: time, error: error, stackTrace: stackTrace);
  }
}
