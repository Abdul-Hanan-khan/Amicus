

import 'package:amicus/core/utills/app_apis.dart';

import 'network_client.dart';

class ApiService {
  static final ApiService _service = ApiService._internal();

  factory ApiService() {
    return _service;
  }

  ApiService._internal();

  static NetworkClient networkClient = NetworkClient(AppApis.baseUrl);
}
