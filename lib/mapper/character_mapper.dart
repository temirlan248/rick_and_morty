import 'dart:convert';

import 'package:rick_and_morty/dto/character_dto.dart';
import 'package:rick_and_morty/model/character.dart';

class CharacterMapper extends Converter<CharacterDto, Character> {
  @override
  Character convert(CharacterDto input) {
    return Character(
      id: input.id,
      name: input.name,
      image: input.image,
    );
  }
}
