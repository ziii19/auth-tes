import 'package:efra_intern/domain/usecases/get_user_detail_usecase.dart';
import 'package:efra_intern/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/user_detail.dart';
import '../../core/error/exceptions.dart';

class AuthProvider with ChangeNotifier {
  final LoginUsecase loginUseCase;
  final GetUserDetailUseCase getUserDetailUseCase;
  final SharedPreferences prefs;

  AuthProvider({
    required this.loginUseCase,
    required this.getUserDetailUseCase,
    required this.prefs,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  User? _user;
  User? get user => _user;

  UserDetail? _userDetail;
  UserDetail? get userDetail => _userDetail;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _user = await loginUseCase(username, password);
      notifyListeners();

      // Setelah login berhasil, fetch detail user
      await fetchUserDetail();
    } on AuthenticationException catch (e) {
      _errorMessage = e.message;
    } on ServerException catch (e) {
      _errorMessage = e.message;
    } catch (e) {
      _errorMessage = 'An unexpected error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchUserDetail() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _userDetail = await getUserDetailUseCase.call();
      notifyListeners();
    } on ServerException catch (e) {
      _errorMessage = e.message;
    } catch (e) {
      _errorMessage = 'An unexpected error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _user = null;
    _userDetail = null;
    _errorMessage = null;
    notifyListeners();
  }
}
