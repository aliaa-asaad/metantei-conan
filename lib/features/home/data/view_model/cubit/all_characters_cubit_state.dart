part of 'all_characters_cubit_cubit.dart';

@immutable
sealed class AllCharactersState {}

final class AllCharactersCubitInitial extends AllCharactersState {}

class AllCharactersLoading extends AllCharactersState {}

class AllCharactersLoaded extends AllCharactersState {
  final List<AllCharacters> allCharactersState;
  AllCharactersLoaded(this.allCharactersState);
}

class AllCharactersError extends AllCharactersState {
  final String message;
  AllCharactersError(this.message);
}
