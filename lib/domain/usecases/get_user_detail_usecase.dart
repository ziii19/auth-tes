import '../entities/user_detail.dart';
import '../repositories/auth_repository.dart';

class GetUserDetailUseCase {
  final AuthRepository repository;

  GetUserDetailUseCase(this.repository);

  Future<UserDetail> call() async {
    return await repository.getUserDetail();
  }
}
