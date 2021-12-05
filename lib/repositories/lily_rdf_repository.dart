import 'package:lily_searcher/api/http_client_api.dart';
import 'package:lily_searcher/repositories/i_lily_rdf_repository.dart';
import 'package:lily_searcher/utils/enums.dart';

class LilyRdfRepository implements ILilyRdfRepository {
  LilyRdfRepository(this._apiClient);

  final HttpClientApi _apiClient;

  @override
  Future<String> retrieveLilyList(String queryWord) async {
    StringBuffer sb = StringBuffer();

    sb.writeln('PREFIX schema: <http://schema.org/>');
    sb.writeln('PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>');
    sb.writeln('PREFIX lily: <https://lily.fvhp.net/rdf/IRIs/lily_schema.ttl#>');

    sb.writeln('SELECT ?lily ?name ?nameKana ?garden ?position');
    sb.writeln('WHERE {');
    sb.writeln('  ?lily a lily:Lily;');
    sb.writeln('        schema:name ?name;');
    sb.writeln('        lily:nameKana ?nameKana;');
    sb.writeln('        lily:garden  ?garden;');
    sb.writeln('        lily:position ?position.');
    sb.writeln('  FILTER(CONTAINS(?nameKana,"$queryWord") || CONTAINS(?name, "$queryWord"))');
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

  @override
  Future<String> retrieveLilyDetail(String key) async {

    StringBuffer sb = StringBuffer();

    sb.writeln("PREFIX   lilyrdf: <https://lily.fvhp.net/rdf/RDFs/detail/>");
    sb.writeln("DESCRIBE lilyrdf:$key");

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

  @override
  Future<String> linkedSearch(String key, SearchType type) async {
    StringBuffer sb = StringBuffer();

    sb.writeln('PREFIX schema: <http://schema.org/>');
    sb.writeln('PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>');
    sb.writeln('PREFIX lily: <https://lily.fvhp.net/rdf/IRIs/lily_schema.ttl#>');



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
