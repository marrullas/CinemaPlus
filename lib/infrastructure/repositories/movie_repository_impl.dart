import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource moviesDatasource;

  MovieRepositoryImpl(this.moviesDatasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesDatasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return moviesDatasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return moviesDatasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return moviesDatasource.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieById(String movieId) {
    return moviesDatasource.getMovieById(movieId);
  }
  
  @override
  Future<List<Movie>> searchMovies(String query) {
    return moviesDatasource.searchMovies(query);
  }
}
