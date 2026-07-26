part of 'character_cubit.dart';

sealed class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

final class CharacterInitial extends CharacterState {}

final class CharacterLoading extends CharacterState {}

final class CharacterSuccess extends CharacterState {
  final List<CharacterEntity> characterList;

  const CharacterSuccess({required this.characterList});

  @override
  List<Object> get props => [characterList];
}

final class CharacterFailure extends CharacterState {
  final String message;

  const CharacterFailure({required this.message});

  @override
  List<Object> get props => [message];
}
