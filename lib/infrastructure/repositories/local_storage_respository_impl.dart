import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';

import '../../domain/datasources/local_storage_datasource.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDataSource _localStorageDataSource;

  LocalStorageRepositoryImpl(this._localStorageDataSource);

  @override
  Future<bool> isMovieFavorite(int movieId) {
    return _localStorageDataSource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) {
    return _localStorageDataSource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return _localStorageDataSource.toggleFavorite(movie);
  }
}
