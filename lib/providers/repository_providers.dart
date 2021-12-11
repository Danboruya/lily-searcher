import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:lily_searcher/repositories/lily_rdf_repository.dart';

final lilyRdfRepositoryProvider =
    Provider.autoDispose<LilyRdfRepository>((ref) => LilyRdfRepository(ref.read(apiProvider)));
