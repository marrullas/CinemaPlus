import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:dio/dio.dart';

import '../models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDbKey,
        'language': 'es-MX'
      }));

  List<Actor> _jsonToActors(Map<String, dynamic> json) {
    final creditsResponse = CreditsResponse.fromJson(json);

    final List<Actor> actors = creditsResponse.cast
        .map((actordb) => ActorMapper.castToEntity(actordb))
        .toList();

    return actors;
  }

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    if (response.statusCode == null) throw Exception('Error, no se pudo obtener los actores');

    return _jsonToActors(response.data);

  }
}
