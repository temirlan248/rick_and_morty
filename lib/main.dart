import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/bloc/characters_bloc.dart';
import 'package:rick_and_morty/core/bloc_state_observer.dart';
import 'package:rick_and_morty/di/di.dart';
import 'package:rick_and_morty/di/utils.dart';
import 'package:rick_and_morty/view/characters_page.dart';

void main() {
  Bloc.observer = BlocStateObserver();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => context.di<CharactersBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => CharactersPage(),
    ),
  ],
);
