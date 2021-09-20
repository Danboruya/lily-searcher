abstract class IHttpClientApi {
  Future<String> postQuery(Uri uri, Map<String, String> queryBody);
}