import 'package:character_hub/core/utils/failure/server_failure.dart';
import 'package:character_hub/feature/home/data_source/remote_data_source/character_remote_data_source.dart';
import 'package:character_hub/feature/home/domain/entity/character_entity.dart';
import 'package:character_hub/feature/home/domain/repo/character_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
class CharacterRepoImpl implements CharacterRepo {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<ServerFailure, List<CharacterEntity>>> getAllCharacter({
    String? status,
    String? name,
  }) async {
    try {
      final result = await remoteDataSource.getAllCharacter(
        status: status,
        name: name,
      );
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioExcepiton(e));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}