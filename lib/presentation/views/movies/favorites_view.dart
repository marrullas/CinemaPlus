import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {

  

  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    //ref.read(favoritesMoviesProvider.notifier).loadNextPageFavoriteMovies();



    loadNextPage();
  }

  void loadNextPage() {
    if ( !isLastPage && !isLoading ) {
      isLoading = true;
      final movies = ref.read(favoritesMoviesProvider.notifier).loadNextPageFavoriteMovies();
      movies.then((value) {
        if ( value.length < 10 ) {
          isLastPage = true;
        }
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(favoritesMoviesProvider).values.toList();


    if ( favoritesMovies.isEmpty ) {
      return Column(
        children: [
          const SizedBox(height: 40 ),
          const Icon(Icons.favorite_border, size: 100, color: Colors.grey),
          const Text('Oops!', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const Text('No hay peliculas favoritas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20 ),
          FilledButton.tonal(
            onPressed: () => context.go('/home/0'), 
            child: const Text('Explorar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          )
        ],
      );
    }

    return Scaffold(
        body: MovieMasonry(
          
          loadNextPage: loadNextPage,
          movies: favoritesMovies,)
            );
  }
}
