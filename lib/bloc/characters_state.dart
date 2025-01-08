import 'package:rick_and_morty/model/character.dart';

sealed class CharactersState {
  bool get shouldRebuild => switch (this) {
        CharactersInitial() => true,
        CharactersLoading() => false,
        CharactersFailure() => false,
        CharactersSuccess() => true,
        CharactersPageLoading() => false,
      };

  bool get isUpdating => switch (this) {
        CharactersInitial() => false,
        CharactersLoading() => true,
        CharactersFailure() => false,
        CharactersSuccess() => false,
        CharactersPageLoading() => true,
      };

  bool get getShowPaginationLoading => this is CharactersPageLoading;
}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersPageLoading extends CharactersState {}

class CharactersFailure extends CharactersState {
  final String? message;

  CharactersFailure([
    this.message,
  ]);
}

class CharactersSuccess extends CharactersState {
  final List<Character> characters;
  final int currentPage;
  final bool reachedEnd;

  CharactersSuccess({
    required this.characters,
    required this.currentPage,
    required this.reachedEnd,
  });
}
