import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final favoritesMoviesProvider = StateNotifierProvider<StorageMoviesNotefier, Map<int,Movie>>(
  (ref) {

    return StorageMoviesNotefier(
      localStorageRepository: ref.watch(localStorageRepositoryProvider),
    );
  }
);

class StorageMoviesNotefier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotefier(
    {required this.localStorageRepository
    }) : super({});


  Future<List<Movie>> loadNextPageFavoriteMovies() async {
    final movies = await localStorageRepository.loadMovies(offset: page * 10, limit: 20);
    page++;


    state = {
      ...state,
      ...{ for (var e in movies) e.id : e }
    };

    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async{
    await localStorageRepository.toggleFavorite(movie);
    final bool isMovieFavorite = state[movie.id] != null;

    if (isMovieFavorite){
      state.remove(movie.id);
      state = {...state};
    }

  }

}
