

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';

//repositorio inmutable solo lectura
final movieRepositoryProvider = Provider<MovieRepositoryImpl>((ref) {
  //final datasource = ref.watch(movieDatasourceProvider);
  return MovieRepositoryImpl(MovieDbDatasource());
});