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

    sb.writeln("PREFIX lilyrdf: <https://lily.fvhp.net/rdf/RDFs/detail/>");
    sb.writeln("PREFIX lily: <https://lily.fvhp.net/rdf/IRIs/lily_schema.ttl#>");
    sb.writeln("PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>");
    sb.writeln("PREFIX schema: <http://schema.org/>");

    sb.writeln("SELECT ?s ?p ?o");
    sb.writeln("WHERE {");
    sb.writeln("    {");
    sb.writeln("        VALUES ?s { lilyrdf:$key }");
    sb.writeln("        ?s ?p ?o.");
    sb.writeln("    }");
    sb.writeln("    UNION");
    sb.writeln("    {");
    sb.writeln("        VALUES ?p { schema:name lily:resource lily:usedIn lily:performIn lily:additionalInformation }");
    sb.writeln("        lilyrdf:$key ?rp ?s.");
    sb.writeln("        ?s ?p ?o.");
    sb.writeln("    }");
    sb.writeln("    UNION");
    sb.writeln("    {");
    sb.writeln("        VALUES ?p { schema:productID schema:name rdf:type }");
    sb.writeln("        lilyrdf:$key lily:charm/lily:resource ?s.");
    sb.writeln("        ?s ?p ?o.");
    sb.writeln("    }");
    sb.writeln("    UNION");
    sb.writeln("    {");
    sb.writeln("        VALUES ?p { schema:name rdf:type }");
    sb.writeln("        lilyrdf:$key lily:relationship/lily:resource ?s.");
    sb.writeln("        ?s ?p ?o.");
    sb.writeln("    }");
    sb.writeln("    UNION");
    sb.writeln("    {");
    sb.writeln("        VALUES ?p { schema:name rdf:type }");
    sb.writeln("        lilyrdf:$key schema:sibling/lily:resource ?s.");
    sb.writeln("        ?s ?p ?o.");
    sb.writeln("    }");
    sb.writeln("    UNION");
    sb.writeln("    {");
    sb.writeln("        VALUES ?p { lily:genre schema:name schema:alternateName rdf:type }");
    sb.writeln("        lilyrdf:$key lily:cast/lily:performIn ?s.");
    sb.writeln("        ?s ?p ?o.");
    sb.writeln("    }");
    sb.writeln("}");

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
