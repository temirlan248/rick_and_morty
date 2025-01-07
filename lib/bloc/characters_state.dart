import 'package:rick_and_morty/model/character.dart';

sealed class CharactersState {
  bool get shouldRebuild => switch (this) {
        CharactersInitial() => true,
        CharactersLoading() => true,
        CharactersFailure() => false,
        CharactersSuccess() => true,
      };
}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersFailure extends CharactersState {
  final String? message;

  CharactersFailure([
    this.message,
  ]);
}

class CharactersSuccess extends CharactersState {
  final List<Character> characters;

  CharactersSuccess({
    required this.characters,
  });
}
