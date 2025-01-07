import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty/dto/character_dto.dart';
import 'package:rick_and_morty/dto/location_dto.dart';
import 'package:rick_and_morty/dto/paginated_response.dart';

part 'rick_and_morty_api.g.dart';

@RestApi(baseUrl: 'https://rickandmortyapi.com/api')
abstract class RickAndMortyApi {
  factory RickAndMortyApi(Dio dio, {String? baseUrl}) = _RickAndMortyApi;

  @GET('/character/')
  Future<PaginatedResponse<CharacterDto>> getCharacters({
    @Query('page') required int page,
    @Query('name') String? name,
    @Query('status') String? status,
    @Query('species') String? species,
    @Query('type') String? type,
    @Query('gender') String? gender,
  });

  @GET('/character/{id}')
  Future<CharacterDto> getCharacter({
    @Path() required int id,
  });

  @GET('/character/{id}')
  Future<PaginatedResponse<CharacterDto>> getCharactersByIds({
    @Path() required List<int> id,
  });

  @GET('/location/')
  Future<PaginatedResponse<LocationDto>> getLocations({
    @Query('page') required int page,
    @Query('name') String? name,
    @Query('status') String? dimension,
    @Query('type') String? type,
  });

  @GET('/location/{id}')
  Future<LocationDto> getLocation({
    @Path() required int id,
  });

  @GET('/location/{id}')
  Future<PaginatedResponse<LocationDto>> getLocationsByIds({
    @Path() required List<int> id,
  });
}
