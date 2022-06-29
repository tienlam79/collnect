import 'package:get/get.dart';

import 'base_provider.dart';

class ApiProvider extends BaseProvider {
  Future<Response> getMethod(String path, {query, headers}) {
    Map<String, String> params = {
      'no_cache': DateTime.now().millisecondsSinceEpoch.toString(),
    };
    return get(
      '$path',
      query: query != null ? {...query, ...params} : params,
      headers: headers,
    );
  }

  Future<Response> postMethod(String path, dynamic data, {headers, query}) {
    Map<String, String> params = {
      'no_cache': DateTime.now().millisecondsSinceEpoch.toString(),
    };
    return post(
      '$path',
      data != null ? data.toJson() : null,
      headers: headers,
      query: query != null ? {...query, ...params} : params,
    );
  }

  Future<Response> putMethod(String path, dynamic data, {headers, query}) {
    Map<String, String> params = {
      'no_cache': DateTime.now().millisecondsSinceEpoch.toString(),
    };
    return put(
      '$path',
      data.toJson(),
      headers: headers,
      query: query != null ? {...query, ...params} : params,
    );
  }

  Future<Response> deleteMethod(String path, {headers, query}) {
    Map<String, String> params = {
      'no_cache': DateTime.now().millisecondsSinceEpoch.toString(),
    };
    return delete(
      '$path',
      headers: headers,
      query: query != null ? {...query, ...params} : params,
    );
  }
}
