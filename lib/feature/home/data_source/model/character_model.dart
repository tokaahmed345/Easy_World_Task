import 'package:character_hub/feature/home/domain/entity/character_entity.dart';

class CharacterModel extends CharacterEntity {
  final String url;
  final String created;

  CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.type,
    required super.gender,
    required super.imageUrl,
    required super.originName,
    required super.locationName,
    required this.url,
    required this.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      status: json['status'] ?? 'Unknown',
      species: json['species'] ?? 'Unknown',
      type: (json['type'] != null && json['type'].toString().isNotEmpty)
          ? json['type']
          : 'None',
      gender: json['gender'] ?? 'Unknown',
      imageUrl: json['image'] ?? '',
      originName: (json['origin'] != null && json['origin']['name'] != null)
          ? json['origin']['name']
          : 'Unknown',
      locationName:
          (json['location'] != null && json['location']['name'] != null)
          ? json['location']['name']
          : 'Unknown',
      url: json['url'] ?? '',
      created: json['created'] ?? '',
    );
  }
}
