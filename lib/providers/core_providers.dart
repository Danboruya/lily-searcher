import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/api/http_client_api.dart';
import 'package:lily_searcher/utils/business_exception.dart';
import 'package:lily_searcher/utils/enums.dart';
import 'package:lily_searcher/utils/theme_selector.dart';
import 'package:simple_logger/simple_logger.dart';

final apiProvider =
    Provider.autoDispose((ref) => HttpClientApi(ref.read(loggerProvider)));

final loggerProvider = Provider((ref) => SimpleLogger()
  ..setLevel(
    Level.FINEST,
    includeCallerInfo: true, // Set false on release build
  ));

final businessExceptionProvider =
    StateNotifierProvider<BusinessExceptionStateNotifier, BusinessException>(
        (ref) => BusinessExceptionStateNotifier(ref.read(loggerProvider)));

final themeSelectorProvider = StateNotifierProvider((ref) => ThemeSelector());

final bottomNavigationBarProvider = StateProvider((ref) => TabType.lily);