import 'package:cinemapedia/domain/entities/movie.dart';

import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchMovieProvider = StateNotifierProvider<SearchMoviesNotifier, List<Movie>>((ref) {

  final movieRepository = ref.read(movieRepositoryProvider);

  return SearchMoviesNotifier(
    searchMovies: movieRepository.searchMovies,
    ref: ref,
  );
});

class SearchMoviesNotifier extends StateNotifier<List<Movie>> {
  final Ref ref;
  final SearchMovieCallback searchMovies;

  SearchMoviesNotifier({
    required this.searchMovies,
    required this.ref,
  }) : super([]);

  Future<List<Movie>> searchMovieByQuery(String query) async {

    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
