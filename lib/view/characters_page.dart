import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/characters_bloc.dart';
import 'package:rick_and_morty/bloc/characters_state.dart';
import 'package:rick_and_morty/view/character_view.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        BlocBuilder<CharactersBloc, CharactersState>(
          buildWhen: (context, state) => state.shouldRebuild,
          builder: (context, state) => switch (state) {
            CharactersSuccess() => Scaffold(
                floatingActionButton: GestureDetector(
                  onTap: () =>
                      context.read<CharactersBloc>().getCharacters(page: 0),
                  child: Icon(
                    Icons.refresh,
                    color: Colors.black,
                  ),
                ),
                body: SafeArea(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (!state.reachedEnd &&
                          scrollNotification.metrics.pixels >=
                              scrollNotification.metrics.maxScrollExtent) {
                        context
                            .read<CharactersBloc>()
                            .getCharacters(page: state.currentPage + 1);
                      }
                      return true;
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverList.separated(
                          itemCount: state.characters.length,
                          itemBuilder: (context, index) => CharacterView(
                            state.characters[index],
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            CharactersInitial() => Scaffold(),
            CharactersLoading() ||
            CharactersFailure() ||
            CharactersPageLoading() =>
              throw StateError('No widget on ${state.runtimeType}'),
          },
        ),
        BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            if (state.isUpdating) {
              return SizedBox.square(
                dimension: 64,
                child: CircularProgressIndicator(
                  strokeCap: StrokeCap.round,
                ),
              );
            }
            return SizedBox.shrink();
          },
        )
      ],
    );
  }
}
