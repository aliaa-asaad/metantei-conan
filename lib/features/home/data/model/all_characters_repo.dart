import 'package:dio/dio.dart';
import 'package:metantei_conan/configurations/end_points.dart';
import 'package:metantei_conan/network/web_services.dart';

import 'all_characters_model.dart';

class AllCharactersRepo {
  MetanteiConanNetwork allCharactersNetwork = MetanteiConanNetwork();

  Future<AllCharactersList> getAllCharactersRepo() async {
    final Response response = await allCharactersNetwork.get(
        url: ApiNames.baseUrl + ApiNames.allCharacters);
    AllCharactersList allCharacters = AllCharactersList.fromJson(response.data);
    return allCharacters;
  }
}
