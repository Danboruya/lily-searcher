import 'package:lily_searcher/api/http_client_api.dart';
import 'package:lily_searcher/repositories/i_lily_rdf_repository.dart';

class LilyRdfRepository implements ILilyRdfRepository {
  LilyRdfRepository(this._apiClient);

  final HttpClientApi _apiClient;

  @override
  Future<String> simpleLilySearch(String queryWord) async {
    StringBuffer sb = StringBuffer();

    sb.writeln('PREFIX schema: <http://schema.org/>');
    sb.writeln('PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>');
    sb.writeln('PREFIX lily: <https://lily.fvhp.net/rdf/IRIs/lily_schema.ttl#>');
    sb.writeln('SELECT ?name');
    sb.writeln('WHERE {');
    sb.writeln('  ?lily rdf:type lily:Lily;');
    sb.writeln('        lily:nameKana ?namekana.');
    sb.writeln('  FILTER(CONTAINS(?namekana,"$queryWord") || CONTAINS(?name, "$queryWord"))');
    sb.writeln('  ?lily schema:name ?name.');
    sb.writeln('  FILTER(lang(?name)="ja")');
    sb.writeln('}');

    String query = sb.toString();
    var queryHeader = 'https://lily.fvhp.net/sparql/query';
    var queryBody = {'format': 'json', 'query': query};
    var uri = Uri.parse(queryHeader);

    try {
      return await _apiClient.postQuery(uri, queryBody);
    }
    on Exception catch (error) {
      throw Exception(error);
    }
  }
}
