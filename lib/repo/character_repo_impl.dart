import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/api/rick_and_morty_api.dart';
import 'package:rick_and_morty/dto/character_dto.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/paginated_result.dart';
import 'package:rick_and_morty/model/result.dart';
import 'package:rick_and_morty/repo/character_repo.dart';

@Injectable(as: CharacterRepo)
class CharacterRepoImpl implements CharacterRepo {
  final RickAndMortyApi _api;
  final Converter<CharacterDto, Character> _characterMapper;

  CharacterRepoImpl(
    this._api,
    this._characterMapper,
  );

  @override
  Future<Result<PaginatedData<Character>>> getCharacters({
    required int page,
  }) async {
    try {
      final characterResponse = await _api.getCharacters(page: page);
      final characters = characterResponse.results
          .map(
            _characterMapper.convert,
          )
          .toList();
      return SuccessResult(
        PaginatedData(
          items: characters,
          reachedEnd: characterResponse.info.reachedEnd,
        ),
      );
    } on DioException catch (e) {
      return FailureResult(e.message);
    } catch (_) {
      return FailureResult();
    }
  }
}
