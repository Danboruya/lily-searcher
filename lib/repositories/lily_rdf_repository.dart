import 'package:lily_searcher/api/http_client_api.dart';
import 'package:lily_searcher/repositories/i_lily_rdf_repository.dart';

class LilyRdfRepository implements ILilyRdfRepository {
  LilyRdfRepository(this._apiClient);

  final HttpClientApi _apiClient;

  @override
  Future<String> retrieveLilyList(String queryWord) async {
    StringBuffer sb = StringBuffer();

    sb.writeln('PREFIX schema: <http://schema.org/>');
    sb.writeln('PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>');
    sb.writeln(
        'PREFIX lily: <https://lily.fvhp.net/rdf/IRIs/lily_schema.ttl#>');

    sb.writeln('SELECT ?lily ?name ?nameKana ?garden ?position');
    sb.writeln('WHERE {');
    sb.writeln('  ?lily a lily:Lily;');
    sb.writeln('        schema:name ?name.');
    sb.writeln('  OPTIONAL{?lily lily:nameKana ?nameKana }.');
    sb.writeln('  OPTIONAL{?lily lily:garden ?garden }.');
    sb.writeln('  OPTIONAL{?lily lily:position ?position } .');
    sb.writeln(
        '  FILTER(CONTAINS(?nameKana,"$queryWord") || CONTAINS(?name, "$queryWord"))');
    sb.writeln('  FILTER(lang(?name)="ja")');
    sb.writeln('}');
    sb.writeln('ORDER BY ?name');

    String query = sb.toString();
    var queryHeader = 'https://lily.fvhp.net/sparql/query';
    var queryBody = {'format': 'json', 'query': query};
    var uri = Uri.parse(queryHeader);

    try {
      return await _apiClient.postQuery(uri, queryBody);
    } on Exception catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<String> retrieveAllLilyList() async {
    StringBuffer sb = StringBuffer();

    sb.writeln('PREFIX schema: <http://schema.org/>');
    sb.writeln('PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>');
    sb.writeln(
        'PREFIX lily: <https://lily.fvhp.net/rdf/IRIs/lily_schema.ttl#>');

    sb.writeln('SELECT ?lily ?name ?nameKana ?garden ?position');
    sb.writeln('WHERE {');
    sb.writeln('  ?lily a lily:Lily;');
    sb.writeln('        schema:name ?name.');
    sb.writeln('  OPTIONAL{?lily lily:nameKana ?nameKana }.');
    sb.writeln('  OPTIONAL{?lily lily:garden ?garden }.');
    sb.writeln('  OPTIONAL{?lily lily:position ?position } .');
    sb.writeln('  FILTER(lang(?name)="ja")');
    sb.writeln('}');
    sb.writeln('ORDER BY ?name');

    String query = sb.toString();
    var queryHeader = 'https://lily.fvhp.net/sparql/query';
    var queryBody = {'format': 'json', 'query': query};
    var uri = Uri.parse(queryHeader);

    try {
      return await _apiClient.postQuery(uri, queryBody);
    } on Exception catch (error) {
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
    } on Exception catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<String> retrieveCharmInfo(String charmId) async {
    StringBuffer sb = StringBuffer();
    sb.writeln("PREFIX   lilyrdf: <https://lily.fvhp.net/rdf/RDFs/detail/>");
    sb.writeln("DESCRIBE $charmId");

    String query = sb.toString();
    var queryHeader = 'https://lily.fvhp.net/sparql/query';
    var queryBody = {'format': 'json', 'query': query};
    var uri = Uri.parse(queryHeader);

    try {
      return await _apiClient.postQuery(uri, queryBody);
    } on Exception catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<String> retrieveLegionInfo(String legionId) async {
    StringBuffer sb = StringBuffer();
    sb.writeln("PREFIX   lilyrdf: <https://lily.fvhp.net/rdf/RDFs/detail/>");
    sb.writeln("DESCRIBE $legionId");

    String query = sb.toString();
    var queryHeader = 'https://lily.fvhp.net/sparql/query';
    var queryBody = {'format': 'json', 'query': query};
    var uri = Uri.parse(queryHeader);

    try {
      return await _apiClient.postQuery(uri, queryBody);
    } on Exception catch (error) {
      throw Exception(error);
    }
  }
}
