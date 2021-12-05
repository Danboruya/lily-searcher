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
    sb.writeln(
        'PREFIX lily: <https://lily.fvhp.net/rdf/IRIs/lily_schema.ttl#>');

    sb.writeln('SELECT ?lily ?name ?nameKana ?garden ?position');
    sb.writeln('WHERE {');
    sb.writeln('  ?lily a lily:Lily;');
    sb.writeln('        schema:name ?name;');
    sb.writeln('        lily:nameKana ?nameKana;');
    sb.writeln('        lily:garden  ?garden;');
    sb.writeln('        lily:position ?position.');
    sb.writeln(
        '  FILTER(CONTAINS(?nameKana,"$queryWord") || CONTAINS(?name, "$queryWord"))');
    sb.writeln('  FILTER(lang(?name)="ja")');
    sb.writeln('}');

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
    sb.writeln('PREFIX schema: <http://schema.org/>');
    sb.writeln('PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>');
    sb.writeln('PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>');
    sb.writeln(
        'PREFIX lily: <https://lily.fvhp.net/rdf/IRIs/lily_schema.ttl#>');
    sb.writeln('PREFIX lilyrdf: <https://lily.fvhp.net/rdf/RDFs/detail/>');

    sb.writeln(
        'SELECT DISTINCT ?name ?corpName ?productId ?gen ?valiantCharmName');
    sb.writeln('WHERE {');
    sb.writeln('  $charmId schema:name ?name;');
    sb.writeln('                   schema:manufacturer ?charmUri;');
    sb.writeln('                   schema:productID ?productId;');
    sb.writeln('                   lily:generation ?gen.');
    sb.writeln('  OPTIONAL { $charmId lily:hasVariant ?hasValiantUri }.');
    sb.writeln('  OPTIONAL { $charmId lily:isVariantOf ?isValiantUri }.');
    sb.writeln('  {');
    sb.writeln('    SELECT ?charmUri ?corpName');
    sb.writeln('    WHERE {');
    sb.writeln('      ?charmUri a lily:Corporation;');
    sb.writeln('                  schema:name ?corpName.');
    sb.writeln('    }');
    sb.writeln('  }.');
    sb.writeln('  OPTIONAL {');
    sb.writeln('    SELECT ?hasValiantUri ?valiantCharmName');
    sb.writeln('    WHERE {');
    sb.writeln('      ?hasValiantUri a lily:Charm;');
    sb.writeln('                  schema:name ?valiantCharmName.');
    sb.writeln('    }');
    sb.writeln('  }.');
    sb.writeln('  FILTER(lang(?name)="ja")');
    sb.writeln('  FILTER(lang(?corpName)="ja")');
    sb.writeln('  FILTER(lang(?valiantCharmName)="ja")');
    sb.writeln('}');

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
