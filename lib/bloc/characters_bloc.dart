import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/bloc/characters_state.dart';
import 'package:rick_and_morty/repo/character_repo.dart';

@injectable
class CharactersBloc extends Cubit<CharactersState> {
  final CharacterRepo _characterRepo;

  CharactersBloc(
    this._characterRepo,
  ) : super(CharactersInitial()) {
    getCharacters(page: 0);
  }

  Future<void> getCharacters({
    required int page,
  }) async {
    emit(CharactersInitial());
    final characterResult = await _characterRepo.getCharacters(
      page: page,
    );

    characterResult.fold(
      onSuccess: (characters) => emit(
        CharactersSuccess(characters: characters),
      ),
      onFailure: (message) => emit(
        CharactersFailure(message),
      ),
    );
  }
}
