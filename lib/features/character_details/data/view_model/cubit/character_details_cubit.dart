import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/character_details_model.dart';
import '../../model/character_details_repo.dart';

part 'character_details_state.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  CharacterDetailsCubit(this.name)
      : super(
            CharacterDetailsInitial()); 
            //2
            //طريقة تانية بدل ما احط الميثود فالنافيجيتور وتتنفذ اما اروح للاسكرين فهنا اما هكريت
            // اوبجكت من الكلاس دا هتتنفذ مباشرة لانها هتكون محطوطة فبادي الكونستراكتور
            /* {
    getCharacterDetailsCubit();} */
  CharacterDetailsRepo characterDetailsRepo = CharacterDetailsRepo();
  String name = '';
  CharacterDetailsModel character = CharacterDetailsModel();
   List<Map<String, String?>> details = [
                    {
                      'name': 'English Name',
                      'value': character.englishName,
                    },
                    {
                      'name': 'Japanese Name',
                      'value': bloc.character.japaneseName,
                    },
                    {
                      'name': 'Age',
                      'value': bloc.character.age,
                    },
                    {
                      'name': 'Gender',
                      'value': bloc.character.gender,
                    },
                    {
                      'name': 'Height',
                      'value': bloc.character.height,
                    },
                    {
                      'name': 'Weight',
                      'value': bloc.character.weight,
                    },
                    {
                      'name': 'Date of birth',
                      'value': bloc.character.dateOfBirth,
                    },
                    {
                      'name': 'Relatives',
                      'value': bloc.character.relatives,
                    },
                    {
                      'name': 'Occupation',
                      'value': bloc.character.occupation,
                    },
                    {
                      'name': 'Status',
                      'value': bloc.character.status,
                    },
                    {
                      'name': 'Aliases',
                      'value': bloc.character.aliases,
                    },
                  ];
                 
  void getCharacterDetailsCubit() async {
    emit(CharacterDetailsLoading());
    try {
      List newName = name.split(' ');
      name = newName[0] + '_' + newName[1];
      character = await characterDetailsRepo.getCharacterDetailsRepo(name);
      emit(CharacterDetailsLoaded(character));
    } catch (e) {
      emit(CharacterDetailsError(e.toString()));
    }
  }
}
