import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:snap_grid/src/core/utils/utils.dart';

abstract class AbstractAppNetwork {
  Future<dynamic> getRequest(String url);
  Future<http.Response> getOrdinaryRequest(String url);
}

class AppNetwork implements AbstractAppNetwork {
  //Passed this access key in the environment varibles: --dart-define=
  static const String accessKey = Environment.apiKEY;
  static const Map<String, String> header = {
    'Authorization': "Client-ID $accessKey"
  };
  @override
  Future<dynamic> getRequest(String url,
      {Map<String, String>? customHeader}) async {
    final response =
        await http.get(Uri.parse(url), headers: customHeader ?? header);
    Logger.logInfo(url);
    Logger.logInfo(response.body);
    Logger.logInfo(response.statusCode);
    if (response.statusCode == 200) {
      // Request successful
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      // Bad request
      throw Exception('Bad request');
    } else if (response.statusCode == 401) {
      // Unauthorized
      throw Exception('Unauthorized');
    } else if (response.statusCode == 403) {
      // Forbidden
      throw Exception('Forbidden');
    } else if (response.statusCode == 404) {
      // Not found
      throw Exception('Not found');
    } else if (response.statusCode == 500 || response.statusCode == 503) {
      // Server error
      throw Exception('Something went wrong on the server');
    } else {
      // Handle other status codes if needed
      throw Exception('An error occurred');
    }
  }

  @override
  Future<http.Response> getOrdinaryRequest(String url,
      {Map<String, String>? customHeader}) async {
    final response =
        await http.get(Uri.parse(url), headers: customHeader ?? header);
    Logger.logInfo(response.body);
    Logger.logInfo(response.statusCode);
    if (response.statusCode == 200) {
      // Request successful
      return response;
    } else if (response.statusCode == 400) {
      // Bad request
      throw Exception('Bad request');
    } else if (response.statusCode == 401) {
      // Unauthorized
      throw Exception('Unauthorized');
    } else if (response.statusCode == 403) {
      // Forbidden
      throw Exception('Forbidden');
    } else if (response.statusCode == 404) {
      // Not found
      throw Exception('Not found');
    } else if (response.statusCode == 500 || response.statusCode == 503) {
      // Server error
      throw Exception('Something went wrong on the server');
    } else {
      // Handle other status codes if needed
      throw Exception('An error occurred');
    }
  }
}
