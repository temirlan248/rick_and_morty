import 'package:json_annotation/json_annotation.dart';

part 'location_dto.g.dart';

@JsonSerializable(
  createToJson: false,
)
class LocationDto {
  final int id;
  final String name;

  LocationDto({
    required this.id,
    required this.name,
  });

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);
}
