class CharacterDetailsModel {
  String? japaneseName;
  String? englishName;
  String? age;
  String? gender;
  String? height;
  String? weight;
  String? dateOfBirth;
  String? relatives;
  String? occupation;
  String? status;
  String? aliases;
  String? image;

  CharacterDetailsModel(
      {this.japaneseName,
      this.englishName,
      this.age,
      this.gender,
      this.height,
      this.weight,
      this.dateOfBirth,
      this.relatives,
      this.occupation,
      this.status,
      this.aliases,
      this.image});

  CharacterDetailsModel.fromJson(Map<String, dynamic> json) {
    japaneseName = json['japanese_name']?? 'unknown';
    englishName = json['english_name']?? 'unknown';
    age = json['age'];
    gender = json['gender']?? 'unknown';
    height = json['height']?? 'unknown';
    weight = json['weight']?? 'unknown';
    dateOfBirth = json['date_of_birth']?? 'unknown';
    relatives = json['relatives']?? 'unknown';
    occupation = json['occupation']?? 'unknown';
    status = json['status']?? 'unknown';
    aliases = json['aliases']?? 'unknown';
    image = json['image']?? 'unknown';
  }

  /* Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['japanese_name'] = japaneseName ?? 'empty';
    data['english_name'] = englishName ?? 'empty';
    data['age'] = age ?? 'empty';
    data['gender'] = gender ?? 'empty';
    data['height'] = height ?? 'empty';
    data['weight'] = weight ?? 'empty';
    data['date_of_birth'] = dateOfBirth ?? 'empty';
    data['relatives'] = relatives ?? 'empty';
    data['occupation'] = occupation ?? 'empty';
    data['status'] = status ?? 'empty';
    data['aliases'] = aliases ?? 'empty';
    data['image'] = image ?? 'empty';
    return data;
  } */
}
