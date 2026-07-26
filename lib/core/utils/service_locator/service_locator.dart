import 'package:character_hub/core/utils/service/api_service.dart';
import 'package:character_hub/core/utils/service/dio_consumer.dart';
import 'package:character_hub/feature/home/data_source/remote_data_source/character_remote_data_source.dart';
import 'package:character_hub/feature/home/data_source/repo_impl/character_repo_impl.dart';
import 'package:character_hub/feature/home/domain/repo/character_repo.dart';
import 'package:character_hub/feature/home/domain/usecase/character_use_case.dart';
import 'package:character_hub/feature/home/presentation/character_cubit/character_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {


  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => DioConsumer(dio: getIt<Dio>()));

  getIt.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSource(apiService: getIt.get<ApiService>()),
  );

  getIt.registerLazySingleton<CharacterRepoImpl>(
    () =>
        CharacterRepoImpl(remoteDataSource: getIt<CharacterRemoteDataSource>()),
  );

  getIt.registerLazySingleton<CharacterRepo>(
    () =>
        CharacterRepoImpl(remoteDataSource: getIt<CharacterRemoteDataSource>()),
  );
  getIt.registerLazySingleton<CharacterUseCase>(
    () => CharacterUseCase(getIt<CharacterRepo>()),
  );

  getIt.registerFactory<CharacterCubit>(
    () => CharacterCubit(getIt.get<CharacterUseCase>()),
  );
}
