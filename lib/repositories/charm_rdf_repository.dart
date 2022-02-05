import 'package:lily_searcher/api/http_client_api.dart';
import 'package:lily_searcher/repositories/i_charm_rdf_repository.dart';

class CharmRdfRepository implements ICharmRdfRepository {
  CharmRdfRepository(this._apiClient);

  final HttpClientApi _apiClient;

  @override
  Future<String> retrieveAllCharmList() async {
    StringBuffer sb = StringBuffer();

    sb.writeln('PREFIX schema: <http://schema.org/>');
    sb.writeln('PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>');
    sb.writeln('PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>');
    sb.writeln(
        'PREFIX lily: <https://lily.fvhp.net/rdf/IRIs/lily_schema.ttl#>');
    sb.writeln('PREFIX lilyrdf: <https://lily.fvhp.net/rdf/RDFs/detail/>');
    sb.writeln('PREFIX foaf: <http://xmlns.com/foaf/0.1/>');

    sb.writeln(
        'SELECT DISTINCT ?charm ?name ?generation ?seriesName ?productID');
    sb.writeln('WHERE {');
    sb.writeln('  ?charm a lily:Charm;');
    sb.writeln('         schema:name ?name.');
    sb.writeln('  OPTIONAL {?charm lily:generation ?generation}.');
    sb.writeln('  OPTIONAL {?charm lily:seriesName ?seriesName}.');
    sb.writeln('  OPTIONAL {?charm schema:productID ?productID}.');
    sb.writeln('  FILTER(lang(?name)="ja")');
    sb.writeln('  FILTER(lang(?seriesName)="ja")');
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
  Future<String> retrieveCharmList(
      String queryWord, String queryKatakanaWord) async {
    StringBuffer sb = StringBuffer();

    sb.writeln('PREFIX schema: <http://schema.org/>');
    sb.writeln('PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>');
    sb.writeln(
        'PREFIX lily: <https://lily.fvhp.net/rdf/IRIs/lily_schema.ttl#>');

    sb.writeln(
        'SELECT DISTINCT ?charm ?name ?generation ?seriesName ?productID');
    sb.writeln('WHERE {');
    sb.writeln('  ?charm a lily:Charm;');
    sb.writeln('         schema:name ?name.');
    sb.writeln('  OPTIONAL {?charm lily:generation ?generation}.');
    sb.writeln('  OPTIONAL {?charm lily:seriesName ?seriesName}.');
    sb.writeln('  OPTIONAL {?charm schema:productID ?productID}.');
    sb.writeln('  FILTER(lang(?name)="ja")');
    sb.writeln('  FILTER(lang(?seriesName)="ja")');
    sb.writeln(
        '  FILTER(CONTAINS(?name, "$queryWord") || CONTAINS(?name, "$queryKatakanaWord"))');
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
}
