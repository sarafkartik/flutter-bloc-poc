import 'package:dio/dio.dart';
import 'package:flutter_bloc_poc/models/dto/random_message_dto.dart';

class ApiClient {
  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() => _singleton;
  late Dio _dio;

  //configuration
  final _randomChatBaseUrl = "https://api.quotable.io/random";
  final _standardTimeout = const Duration(seconds: 3);

  ApiClient._internal() {
    final initOptions = BaseOptions(
        method: 'GET',
        connectTimeout: _standardTimeout,
        receiveTimeout: _standardTimeout,
        sendTimeout: _standardTimeout);
    _dio = Dio(initOptions);
  }

  static ApiClient get getInstance => _singleton;

  Dio getClient() => _dio;

  Future<RandomMessageDto> getRandomMessage() async {
    final response = await _dio.get(_randomChatBaseUrl);
    return randomChatModelFromJson(response.toString());
  }
}
