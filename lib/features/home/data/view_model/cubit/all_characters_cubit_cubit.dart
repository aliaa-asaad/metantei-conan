import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:metantei_conan/features/home/data/model/all_characters_model.dart';
import 'package:metantei_conan/features/home/data/model/all_characters_repo.dart';

part 'all_characters_cubit_state.dart';

class AllCharactersCubit extends Cubit<AllCharactersState> {
  AllCharactersRepo allCharactersRepo = AllCharactersRepo();
  AllCharactersList allCharacters = AllCharactersList();
  AllCharactersCubit() : super(AllCharactersCubitInitial());
  void getAllCharactersCubit() async {
    emit(AllCharactersLoading());
    try {
      allCharacters = await allCharactersRepo.getAllCharactersRepo();
      emit(AllCharactersLoaded(allCharacters.characters!));
    } catch (e) {
      emit(AllCharactersError(e.toString()));
    }
  }
}
