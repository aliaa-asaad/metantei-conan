// ignore_for_file: public_member_api_docs, sort_constructors_first
class AllCharactersList {
  List<AllCharacters>? characters;
  AllCharactersList({
    this.characters,
  });
  factory AllCharactersList.fromJson(Map<String, dynamic> json) =>
      AllCharactersList(
        characters: List<AllCharacters>.from(
            json["characters"].map((x) => AllCharacters.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "characters": List<dynamic>.from(characters!.map((x) => x.toJson())),
      };
}

class AllCharacters {
  String? name;
  String? role;
  String? picture;
  String? link;

  AllCharacters({
    this.name,
    this.role,
    this.picture,
    this.link,
  });

  factory AllCharacters.fromJson(Map<String, dynamic> json) => AllCharacters(
        name: json["name"],
        role: json["role"],
        picture: json["picture"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "role": role,
        "picture": picture,
        "link": link,
      };
}
