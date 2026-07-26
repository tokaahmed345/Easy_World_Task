import 'package:character_hub/core/utils/failure/server_failure.dart';
import 'package:character_hub/feature/home/domain/entity/character_entity.dart';
import 'package:character_hub/feature/home/domain/repo/character_repo.dart';
import 'package:dartz/dartz.dart';

class CharacterUseCase {
  final CharacterRepo characterRepo;

  CharacterUseCase(this.characterRepo);

  Future<Either<ServerFailure, List<CharacterEntity>>> fetchAllCharacter({
    String? status,
    String? name,
  }) {
    return characterRepo.getAllCharacter(status: status, name: name);
  }
}