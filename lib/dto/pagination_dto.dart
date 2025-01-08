import 'package:json_annotation/json_annotation.dart';

part 'pagination_dto.g.dart';

@JsonSerializable(
  createToJson: false,
)
class PaginationDto {
  final int count;
  final String? next;

  bool get reachedEnd => next == null;

  PaginationDto({
    required this.count,
    required this.next,
  });

  factory PaginationDto.fromJson(Map<String, dynamic> json) =>
      _$PaginationDtoFromJson(json);
}
