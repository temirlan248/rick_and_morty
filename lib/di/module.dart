import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/api/rick_and_morty_api.dart';

@module
abstract class Module {
  @factoryMethod
  RickAndMortyApi rickAndMortyApi(
    Dio dio,
  ) {
    return RickAndMortyApi(
      dio,
    );
  }

  @factoryMethod
  Dio dio() => Dio();
}
