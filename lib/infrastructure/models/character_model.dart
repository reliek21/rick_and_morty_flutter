class CharacterModel {
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;

  const CharacterModel({
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
        name: json['name'] as String,
        status: json['status'] as String,
        species: json['species'] as String,
        gender: json['gender'] as String,
        image: json['image'] as String,
      );
  }
}
