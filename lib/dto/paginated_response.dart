import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/dto/pagination_dto.dart';

part 'paginated_response.g.dart';

@JsonSerializable(
  createToJson: false,
  genericArgumentFactories: true,
)
class PaginatedResponse<T> {
  final PaginationDto info;

  final List<T> results;

  PaginatedResponse({
    required this.info,
    required this.results,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedResponseFromJson(json, fromJsonT);
}
