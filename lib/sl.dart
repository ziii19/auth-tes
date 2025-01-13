import 'package:efra_intern/core/constatns/constant.dart';
import 'package:efra_intern/domain/usecases/get_user_detail_usecase.dart';
import 'package:efra_intern/domain/usecases/login_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repositories/auth_repository_impl.dart';
import '../data/sources/remote/auth_remote_data_source.dart';
import '../domain/repositories/auth_repository.dart';
import '../presentation/providers/auth_provider.dart';
import 'core/network/api_client.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerSingleton<SharedPreferences>(sharedPreferences);

    // http
  sl.registerLazySingleton(() => http.Client());

  // Providers
  sl.registerFactory<AuthProvider>(() => AuthProvider(
        loginUseCase: sl(),
        getUserDetailUseCase: sl(),
        prefs: sl(),
      ));

  // Use Cases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => GetUserDetailUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        sl(),
      ));

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(apiClient: sl(), prefs: sl()));

  // Core
  sl.registerLazySingleton<ApiClient>(() => ApiClient(Constant.baseUrl));

}
