

import 'package:cinemapedia/domain/entities/movies.dart';

abstract class MoviesDatasource{
  Future<List<Movie>> getNowPlaying();
}