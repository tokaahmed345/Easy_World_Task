import 'package:character_hub/core/utils/failure/server_failure.dart';
import 'package:character_hub/feature/home/domain/entity/character_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CharacterRepo {
  Future<Either<ServerFailure, List<CharacterEntity>>> getAllCharacter({
    String? status,
    String? name,
  });
}
