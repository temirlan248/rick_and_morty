import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/bloc/characters_state.dart';
import 'package:rick_and_morty/core/cast_utils.dart';
import 'package:rick_and_morty/repo/character_repo.dart';

@injectable
class CharactersBloc extends Cubit<CharactersState> {
  final CharacterRepo _characterRepo;

  CharactersBloc(
    this._characterRepo,
  ) : super(CharactersInitial()) {
    Future.delayed(Duration.zero, () => getCharacters(page: 0));
  }

  Future<void> getCharacters({
    required int page,
  }) async {
    if (state.isUpdating) {
      return;
    }
    final items = castOrNull<CharactersSuccess>(state)?.characters ?? [];
    emit(
      page == 0 ? CharactersLoading() : CharactersPageLoading(),
    );
    final characterResult = await _characterRepo.getCharacters(
      page: page,
    );

    characterResult.fold(
      onSuccess: (paginatedData) => emit(
        CharactersSuccess(
          characters: items + paginatedData.items,
          currentPage: page + 1,
          reachedEnd: paginatedData.reachedEnd,
        ),
      ),
      onFailure: (message) => emit(
        CharactersFailure(message),
      ),
    );
  }
}
