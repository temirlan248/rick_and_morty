import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/characters_bloc.dart';
import 'package:rick_and_morty/bloc/characters_state.dart';
import 'package:rick_and_morty/view/character_view.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      buildWhen: (context, state) => state.shouldRebuild,
      builder: (context, state) => switch (state) {
        CharactersSuccess() => Scaffold(
            body: SafeArea(
              bottom: false,
              child: CustomScrollView(
                slivers: [
                  SliverList.separated(
                    itemCount: state.characters.length,
                    itemBuilder: (context, index) => CharacterView(
                      state.characters[index],
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                  ),
                ],
              ),
            ),
          ),
        CharactersInitial() || CharactersLoading() => Scaffold(
            body: SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        CharactersFailure() =>
          throw StateError('No widget on CharactersFailure'),
      },
    );
  }
}
