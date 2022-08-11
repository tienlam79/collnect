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

  Future<dynamic> revokeToken(RefershTokenRequest data) async {
    try {
      final res =
          await apiProvider.postMethod('/customer-api/auth/token/revoke', data);
      return res.body;
      // return GenerateTokenResponse.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<PagingResponse> getNearbyStores(
    int page,
    int pageSize,
    // double xLatitude,
    // double xLongitude,
    String sortBy,
  ) async {
    try {
      final res = await apiProvider.getMethod(
        '/customer-api/customer/retailer-infos',
        query: {
          'page': '$page',
          'page_size': '$pageSize',
          'order_by': sortBy,
        },
        // headers: {
        //   'x-latitude': '$xLatitude',
        //   'x-longitude': '$xLongitude',
        // },
      );
      // print('....$xLatitude  $xLongitude $sortBy');
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
    try {
      final res = await apiProvider.postMethod(
        '/customer-api/customer/orders',
        payload,
      );
      return Order.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<PagingResponse> getPreOrders(int page, int pageSize) async {
    try {
      final res =
          await apiProvider.getMethod('/customer-api/customer/orders', query: {
        'page': '$page',
        'page_size': '$pageSize',
      });
      return PagingResponse.fromJson(res.body);
    } catch (error) {
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

  Future<Order?> getPendingPreOrder() async {
    try {
      final res = await apiProvider.getMethod(
        '/customer-api/customer/orders/pending',
      );
      if (res.body.isEmpty) {
        return null;
      }
      return Order.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<Store> getStoreById(int storeId) async {
    try {
      final res = await apiProvider.getMethod(
        '/customer-api/customer/retailer-infos/$storeId',
      );
      return Store.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<PagingResponse> getStoreReviews(
      int page, int pageSize, int? userId) async {
    try {
      final res = await apiProvider
          .getMethod('/customer-api/customer/retailer-reviews', query: {
        'page': '$page',
        'page_size': '$pageSize',
        'user': userId == null ? null : '$userId'
      });
      return PagingResponse.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<Comment> favoriteStore(FavoriteStoreRequest payload) async {
    try {
      final res = await apiProvider.postMethod(
          '/customer-api/customer/retailer-reviews', payload);
      return Comment.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<Order> cancelPendingPreOrder(preOrderId) async {
    try {
      final res = await apiProvider.postMethod(
          '/customer-api/customer/orders/$preOrderId/cancel', null);
      return Order.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }

  Future<Profile> updateProfile(UpdateProfileRequest payload) async {
    try {
      final res = await apiProvider.putMethod(
          '/customer-api/customer/profile', payload);
      return Profile.fromJson(res.body);
    } catch (error) {
      throw error;
    }
  }
}
