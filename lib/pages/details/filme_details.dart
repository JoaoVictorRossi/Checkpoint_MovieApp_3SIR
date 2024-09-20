import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import '../favorites/widgets/favorite_movies.dart';
import 'package:movie_app/pages/similar/similar_movies_page.dart';

class FilmeDetailsPage extends StatefulWidget {
  final Movie movie;

  const FilmeDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<FilmeDetailsPage> createState() => _FilmeDetailsPageState();
}

class _FilmeDetailsPageState extends State<FilmeDetailsPage> {
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    isFavorited = FavoriteMovies().isFavorited(widget.movie.title);
  }

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;

      if (isFavorited) {
        FavoriteMovies().addMovie(widget.movie.title);
      } else {
        FavoriteMovies().removeMovie(widget.movie.title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://image.tmdb.org/t/p/w200/${widget.movie.posterPath}',
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Release Date: ${widget.movie.releaseDate?.year ?? 'N/A'}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 5),
                      Text(
                        '${widget.movie.voteAverage}/10',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        widget.movie.overview,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Colocando os botões lado a lado
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: toggleFavorite,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor:
                              isFavorited ? Colors.yellow : Colors.white,
                        ),
                        child: Text(isFavorited ? 'Favoritado' : 'Favoritar'),
                      ),
                      const SizedBox(width: 10), // Espaço entre os botões
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SimilarMoviesPage(movie: widget.movie),
                            ),
                          );
                        },
                        child: const Text(
                          'Ver semelhantes',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
