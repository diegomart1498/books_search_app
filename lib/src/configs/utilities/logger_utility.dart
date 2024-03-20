part of 'package.dart';

final logger = Logger(
  filter: MyFilter(),
  printer: PrettyPrinter(methodCount: 0),
);

final loggerTrace = Logger(
  filter: MyFilter(),
  printer: PrettyPrinter(methodCount: 5),
);

void loggi(
  dynamic message, [
  dynamic error,
  StackTrace? stackTrace,
]) {
  logger.i(
    message,
    error: error,
    stackTrace: stackTrace,
  );
}

void logge(
  dynamic message, [
  dynamic error,
  StackTrace? stackTrace,
]) {
  loggerTrace.e(
    message,
    error: error,
    stackTrace: stackTrace,
  );
}

void loggwtf(
  dynamic message, [
  dynamic error,
  StackTrace? stackTrace,
]) {
  logger.f(
    message,
    error: error,
    stackTrace: stackTrace,
  );
}

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
