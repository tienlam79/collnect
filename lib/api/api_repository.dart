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
        '/customer-api/customer/profile',
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

  Future<PagingResponse> getNearbyStores(int page, int pageSize) async {
    try {
      final res = await apiProvider
          .getMethod('/customer-api/customer/retailer-infos', query: {
        'page': '$page',
        'page_size': '$pageSize',
      });
      return PagingResponse.fromJson(res.body);
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

  Future<Order> createPreOrder(CreateOrderRequest payload) async {
    print('..payload. ${payload.toJson()}');
    try {
      final res = await apiProvider.postMethod(
        '/customer-api/customer/orders',
        payload,
      );
      print('res,,${res.body}');
      return Order.fromJson(res.body);
    } catch (error) {
      print('errro,,${error.toString()}');
      throw error;
    }
  }

  Future<Order> getPreOrder(int id) async {
    try {
      final res = await apiProvider.getMethod(
        '/customer-api/customer/orders/$id',
      );
      return Order.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }
}
