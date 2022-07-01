import 'dart:async';
import 'package:omny_business/models/models.dart';
import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<LoginResponse> login(LoginRequest data) async {
    try {
      final res =
          await apiProvider.postMethod('/business-api/auth/authenticate', data);
      return LoginResponse.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<RegisterResponse> register(RegisterRequest data) async {
    try {
      final res =
          await apiProvider.postMethod('/business-api/auth/register', data);
      return RegisterResponse.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future sendVerificationCode(SendVerificationCodeRequest data) async {
    try {
      final res = await apiProvider.postMethod(
          '/business-api/auth/phone-verification', data);
      return res.body;
    } catch (error) {
      throw error;
    }
  }

  Future<GenerateTokenResponse> generateToken(GenerateTokenRequest data) async {
    try {
      final res = await apiProvider.postMethod(
          '/business-api/auth/token/generate', data);
      return GenerateTokenResponse.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<GenerateTokenResponse> getRefershToken(
      RefershTokenRequest data) async {
    try {
      final res = await apiProvider.postMethod(
        '/business-api/auth/token/refresh',
        data,
      );
      return GenerateTokenResponse.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<Profile> getProfile() async {
    try {
      final res = await apiProvider.getMethod(
        '/business-api/retailer/profile',
      );
      return Profile.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<GenerateTokenResponse> revokeToken(RefershTokenRequest data) async {
    try {
      final res =
          await apiProvider.postMethod('/business-api/auth/token/revoke', data);
      return GenerateTokenResponse.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<Product> getProduct(ProductRequest payload) async {
    try {
      print('...payload ${payload.toJson()}');
      final res = await apiProvider.getMethod('/product-api/product',
          query: payload.toJson());
      print('===res.body ${res.body}');
      return Product.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }
}
