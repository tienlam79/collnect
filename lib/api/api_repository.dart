import 'dart:async';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/models/response/verification_code_response.dart';
import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future sendVerificationCode(VerificationCodeRequest data) async {
    try {
      final res = await apiProvider.postMethod(
          '/customer-api/auth/phone-verification', data);
      return VerificationCodeResponse.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<GenerateTokenResponse> generateToken(GenerateTokenRequest data) async {
    try {
      final res = await apiProvider.postMethod(
          '/customer-api/auth/token/generate', data);
      return GenerateTokenResponse.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<GenerateTokenResponse> getRefershToken(
      RefershTokenRequest data) async {
    try {
      final res = await apiProvider.postMethod(
        '/customer-api/auth/token/refresh',
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
        '/customer-api/retailer/profile',
      );
      return Profile.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<GenerateTokenResponse> revokeToken(RefershTokenRequest data) async {
    try {
      final res =
          await apiProvider.postMethod('/customer-api/auth/token/revoke', data);
      return GenerateTokenResponse.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<Product> getProduct(ProductRequest payload) async {
    try {
      final res = await apiProvider.getMethod('/product-api/product',
          query: payload.toJson());
      return Product.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> getBusinessOrders() async {
    try {
      final res = await apiProvider.getMethod(
        '/customer-api/retailer/orders',
      );
      // return Product.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<Order> createOrder(CreateOrderRequest payload) async {
    print('..payload. ${payload.toJson()}');
    try {
      final res = await apiProvider.postMethod(
        '/customer-api/retailer/orders',
        payload,
      );
      print('res,,${res.body}');
      return Order.fromJson(res.body);
    } catch (error) {
      print('errro,,${error.toString()}');
      throw error;
    }
  }

  Future<Order> getOrder(int id) async {
    try {
      final res = await apiProvider.getMethod(
        '/customer-api/retailer/orders/$id',
      );
      return Order.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<List<AchOption>> getAchOptions() async {
    try {
      final res = await apiProvider.getMethod(
        '/customer-api/retailer/ach-options',
      );
      print('...res..${res.body}');
      List<AchOption> results = res.body
          .map<AchOption>((entry) => AchOption.fromJson(entry))
          .toList();
      return results;
    } catch (error) {
      throw error;
    }
  }

  Future<AchOrder> createACH(CreateAchRequest payload) async {
    try {
      print('...sdd..${payload.toJson()}');
      final res = await apiProvider.postMethod(
        '/customer-api/retailer/ach-requests',
        payload,
      );
      return AchOrder.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }
}
