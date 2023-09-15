part of 'character_details_cubit.dart';

@immutable
sealed class CharacterDetailsState {}

final class CharacterDetailsInitial extends CharacterDetailsState {}
class CharacterDetailsLoading extends CharacterDetailsState {}

class CharacterDetailsLoaded extends CharacterDetailsState {
  final CharacterDetailsModel charactersState;
  CharacterDetailsLoaded(this.charactersState);
}

class CharacterDetailsError extends CharacterDetailsState {
  final String message;
  CharacterDetailsError(this.message);
}
