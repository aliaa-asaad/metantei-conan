import 'package:dio/dio.dart';
import 'package:metantei_conan/configurations/end_points.dart';
import 'package:metantei_conan/network/web_services.dart';

import 'character_details_model.dart';

class CharacterDetailsRepo {
  MetanteiConanNetwork metanteiConanNetwork = MetanteiConanNetwork();

  Future<CharacterDetailsModel> getCharacterDetailsRepo(String characterName) async {
    final Response response = await metanteiConanNetwork.get(
        url: ApiNames.baseUrl + ApiNames.allCharacters+ApiNames.character+characterName);
    CharacterDetailsModel character = CharacterDetailsModel.fromJson(response.data);
    return character;
  }
}
