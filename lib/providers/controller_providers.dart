import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/controllers/charm_search_controller.dart';
import 'package:lily_searcher/controllers/lily_search_controller.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:lily_searcher/providers/repository_providers.dart';

final lilySearchControllerProvider = Provider.autoDispose<LilySearchController>(
    (ref) => LilySearchController(ref.read(lilyRdfRepositoryProvider),
        ref.read(loggerProvider), ref.read(businessExceptionProvider)));

final charmSearchControllerProvider =
    Provider.autoDispose<CharmSearchController>((ref) => CharmSearchController(
        ref.read(charmRdfRepositoryProvider),
        ref.read(kanaKitProvider),
        ref.read(loggerProvider)));
