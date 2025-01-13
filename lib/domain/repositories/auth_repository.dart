import '../entities/user.dart';
import '../entities/user_detail.dart';

abstract interface class AuthRepository {
  Future<User> login(String username, String password);
  Future<UserDetail> getUserDetail();

}
