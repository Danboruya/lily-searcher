import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kana_kit/kana_kit.dart';
import 'package:lily_searcher/api/http_client_api.dart';
import 'package:lily_searcher/utils/business_exception.dart';
import 'package:lily_searcher/utils/enums.dart';
import 'package:lily_searcher/utils/theme_selector.dart';
import 'package:simple_logger/simple_logger.dart';

final apiProvider =
    Provider.autoDispose<HttpClientApi>((ref) => HttpClientApi(ref.read(loggerProvider)));

final loggerProvider = Provider<SimpleLogger>((ref) => SimpleLogger()
  ..setLevel(
    Level.FINEST,
    includeCallerInfo: true, // Set false on release build
  ));

final businessExceptionProvider =
    StateNotifierProvider<BusinessExceptionStateNotifier, BusinessException>(
        (ref) => BusinessExceptionStateNotifier(ref.read(loggerProvider)));

final themeSelectorProvider = StateNotifierProvider<ThemeSelector, dynamic>((ref) => ThemeSelector());

final bottomNavigationBarProvider = StateProvider<TabType>((ref) => TabType.lily);

final kanaKitProvider = Provider<KanaKit>((ref) => const KanaKit());