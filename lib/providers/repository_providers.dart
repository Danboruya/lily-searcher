import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:lily_searcher/repositories/charm_rdf_repository.dart';
import 'package:lily_searcher/repositories/lily_rdf_repository.dart';

final lilyRdfRepositoryProvider = Provider.autoDispose<LilyRdfRepository>(
    (ref) => LilyRdfRepository(ref.read(apiProvider)));

final charmRdfRepositoryProvider = Provider.autoDispose<CharmRdfRepository>(
    (ref) => CharmRdfRepository(ref.read(apiProvider)));
