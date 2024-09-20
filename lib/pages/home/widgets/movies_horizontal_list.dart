import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/details/filme_details.dart';

class MoviesHorizontalList extends StatelessWidget {
  final List<Movie> movies;

  const MoviesHorizontalList({Key? key, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilmeDetailsPage(movie: movie),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w200/${movie.posterPath}',
                    height: 150,
                  ),
                  Text(movie.title),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
