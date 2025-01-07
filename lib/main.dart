import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/api/rick_and_morty_api.dart';
import 'package:rick_and_morty/bloc/characters_bloc.dart';
import 'package:rick_and_morty/core/bloc_state_observer.dart';
import 'package:rick_and_morty/dto/character_dto.dart';
import 'package:rick_and_morty/mapper/character_mapper.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/repo/character_repo.dart';
import 'package:rick_and_morty/repo/character_repo_impl.dart';
import 'package:rick_and_morty/view/characters_page.dart';

void main() {
  Bloc.observer = BlocStateObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Todo: move to DI
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => RickAndMortyApi(
            Dio(),
          ),
        ),
        RepositoryProvider<Converter<CharacterDto, Character>>(
          create: (context) => CharacterMapper(),
        ),
      ],
      child: RepositoryProvider<CharacterRepo>(
        create: (context) => CharacterRepoImpl(
          context.read<RickAndMortyApi>(),
          context.read<Converter<CharacterDto, Character>>(),
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CharactersBloc(
                context.read<CharacterRepo>(),
              ),
            ),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const CharactersPage(),
          ),
        ),
      ),
    );
  }
}
