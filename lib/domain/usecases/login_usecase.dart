import 'package:efra_intern/domain/entities/user.dart';
import 'package:efra_intern/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<User> call(String username, String password) async {
    return await repository.login(username, password);
  }
}
