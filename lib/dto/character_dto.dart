import 'package:json_annotation/json_annotation.dart';

part 'character_dto.g.dart';

@JsonSerializable(
  createToJson: false,
)
class CharacterDto {
  final int id;
  final String name;
  final String image;

  CharacterDto({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterDtoFromJson(json);
}
