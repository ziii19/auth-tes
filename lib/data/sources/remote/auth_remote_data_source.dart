import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_client.dart';
import '../../models/user_detail_model.dart';
import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String username, String password);
  Future<UserDetailModel> getUserDetail();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;
  final SharedPreferences prefs;

  AuthRemoteDataSourceImpl({required this.apiClient, required this.prefs});

   @override
  Future<UserModel> login(String username, String password) async {
    final response = await apiClient.post('/auth/login', body: {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      prefs.setString('access_token', data['accessToken']);
      prefs.setString('refresh_token', data['refreshToken']);
      return UserModel.fromJson(data);
    } else if (response.statusCode == 401) {
      throw AuthenticationException('Invalid username or password');
    } else {
      throw ServerException('Failed to login');
    }
  }

  @override
  Future<UserDetailModel> getUserDetail() async {
    final accessToken = prefs.getString('access_token') ?? '';

    if (accessToken.isEmpty) {
      throw AuthenticationException('User not logged in');
    }

    final response = await apiClient.get('/user/me', headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserDetailModel.fromJson(data);
    } else {
      throw ServerException('Failed to fetch user details');
    }
  }
}
