// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i229;

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/rick_and_morty_api.dart' as _i240;
import '../bloc/characters_bloc.dart' as _i513;
import '../dto/character_dto.dart' as _i724;
import '../mapper/character_mapper.dart' as _i423;
import '../model/character.dart' as _i745;
import '../repo/character_repo.dart' as _i810;
import '../repo/character_repo_impl.dart' as _i1028;
import 'module.dart' as _i946;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final module = _$Module();
    gh.factory<_i361.Dio>(() => module.dio());
    gh.factory<_i229.Converter<_i724.CharacterDto, _i745.Character>>(
        () => _i423.CharacterMapper());
    gh.factory<_i240.RickAndMortyApi>(
        () => module.rickAndMortyApi(gh<_i361.Dio>()));
    gh.factory<_i810.CharacterRepo>(() => _i1028.CharacterRepoImpl(
          gh<_i240.RickAndMortyApi>(),
          gh<_i229.Converter<_i724.CharacterDto, _i745.Character>>(),
        ));
    gh.factory<_i513.CharactersBloc>(
        () => _i513.CharactersBloc(gh<_i810.CharacterRepo>()));
    return this;
  }
}

class _$Module extends _i946.Module {}
