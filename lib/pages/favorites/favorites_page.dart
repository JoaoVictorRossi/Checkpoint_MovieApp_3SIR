import 'package:flutter/material.dart';
import './widgets/favorite_movies.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    List<String> favoriteMovies = FavoriteMovies().favoriteMoviesList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Movies'),
      ),
      body: favoriteMovies.isEmpty
          ? const Center(
              child: Text('No favorite movies yet.'),
            )
          : ListView.builder(
              itemCount: favoriteMovies.length,
              itemBuilder: (context, index) {
                final movieTitle = favoriteMovies[index];
                
                return ListTile(
                  title: Text(movieTitle),
                  leading: const Icon(Icons.favorite, color: Colors.red),
                );
              },
            ),
    );
  }
}
