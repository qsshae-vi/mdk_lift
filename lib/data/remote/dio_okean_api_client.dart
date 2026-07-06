import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mdklift/data/remote/okean_api.dart';

class DioOkeanApiClient implements OkeanApi {
  final Dio _dio; // непосредственное выполнение запросов к api
  final Dio _pingDio; // ping без авторизации

  DioOkeanApiClient({
    required String host,
    required int port,
    required String login,
    required String password,
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: 'http://$host:$port',
           connectTimeout: const Duration(seconds: 10),
           receiveTimeout: const Duration(seconds: 30), // 30 секунд ждём ответ
           headers: {
             '  ':
                 'Basic ${base64Encode(utf8.encode('$login:$password'))}',
           },
         ),
       ),
       _pingDio = Dio(
         BaseOptions(
           baseUrl: 'http://$host:$port',
           connectTimeout: const Duration(seconds: 10),
           receiveTimeout: const Duration(seconds: 30),
         ),
       );

  @override
  Future<int> ping() async {
    final response = await _pingDio.get('/api/okean4-server/v1/ping');

    return response.statusCode ?? 0;
  }

  @override
  Future<Map<String, dynamic>> rootGroup() async {
    final response = await _dio.get('/api/okean4-server/v1/rootGroup');
    return Map<String, dynamic>.from(response.data as Map);
  }

  @override
  Future<List<Map<String, dynamic>>> children({required int parent}) async {
    final response = await _dio.get(
      '/api/okean4-server/v1/children',
      queryParameters: {'parent': parent},
    );

    return List<Map<String, dynamic>>.from(response.data as List);
  }

  @override
  Future<List<Map<String, dynamic>>> blocks({required int parent}) async {
    final response = await _dio.get(
      '/api/okean4-server/v1/blocks',
      queryParameters: {'parent': parent},
    );

    return List<Map<String, dynamic>>.from(response.data as List);
  }

  @override
  Future<List<Map<String, dynamic>>> events({required int block}) async {
    final response = await _dio.get(
      '/api/okean4-server/v1/events',
      queryParameters: {'block': block},
    );
    return List<Map<String, dynamic>>.from(response.data as List);
  }
}
