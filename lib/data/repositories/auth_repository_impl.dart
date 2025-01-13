import '../../domain/entities/user.dart';
import '../../domain/entities/user_detail.dart';
import '../../domain/repositories/auth_repository.dart';
import '../sources/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

    @override
  Future<User> login(String username, String password) async {
    return await remoteDataSource.login(username, password);
  }

  @override
  Future<UserDetail> getUserDetail() async {
    return await remoteDataSource.getUserDetail();
  }

}
