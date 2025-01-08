import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/paginated_result.dart';
import 'package:rick_and_morty/model/result.dart';

abstract interface class CharacterRepo {
  // TODO: add pagination info in Result
  Future<Result<PaginatedData<Character>>> getCharacters({
    required int page,
  });
}
