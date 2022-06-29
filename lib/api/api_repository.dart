import 'dart:async';

import 'package:omny_business/models/models.dart';
import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<LoginResponse> login(LoginRequest data) async {
    try {
      final res = await apiProvider.post('/auth/authenticate', data);
      return LoginResponse.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<RegisterResponse?> register(RegisterRequest data) async {
    final res = await apiProvider.post('/api/register', data);
    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(res.body);
    }
  }
}
