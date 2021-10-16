import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

class BusinessExceptionStateNotifier extends StateNotifier<BusinessException> {
  BusinessExceptionStateNotifier(_logger,
      [BusinessException? businessException])
      : super(businessException ?? BusinessException("", "", _logger));
}

class BusinessException implements Exception {
  BusinessException(this.title, this.message, this._logger);

  String title;
  String message;
  bool hasException = false;
  final SimpleLogger _logger;

  void create(String? title, String? message) {
    title = title ?? "";
    message = message ?? "";
    hasException = true;
  }

  void _reset() {
    title = "";
    message = "";
    hasException = false;
  }

  @override
  String toString() {
    String _title = title;
    String msg = 'Exception has occurred. Ex message: $message';

    _logger.shout('$_title\n$msg');
    _reset();

    return '$_title\n$msg';
  }
}
