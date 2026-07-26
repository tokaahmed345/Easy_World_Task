import 'package:bloc/bloc.dart';
import 'package:character_hub/feature/home/domain/entity/character_entity.dart';
import 'package:character_hub/feature/home/domain/usecase/character_use_case.dart';
import 'package:equatable/equatable.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterUseCase characterUseCase;

  String selectedStatus = 'All';
  String currentSearchQuery = '';

  CharacterCubit(this.characterUseCase) : super(CharacterInitial());

  Future<void> getAllCharacter({String? status, String? name}) async {
    if (status != null) {
      selectedStatus = status;
    } else {
      selectedStatus = 'All';
    }

    if (name != null) {
      currentSearchQuery = name;
    }

    emit(CharacterLoading());

    final result = await characterUseCase.fetchAllCharacter(
      status: selectedStatus == 'All' ? null : selectedStatus,
      name: currentSearchQuery.isEmpty ? null : currentSearchQuery,
    );

    result.fold(
      (error) => emit(CharacterFailure(message: error.errMessage)),
      (character) => emit(CharacterSuccess(characterList: character)),
    );
  }
}
