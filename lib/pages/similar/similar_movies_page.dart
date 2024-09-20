import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/services/api_services.dart';
import 'package:movie_app/pages/similar/widgets/similar_movie.dart';

class SimilarMoviesPage extends StatefulWidget {
  final Movie movie;

  const SimilarMoviesPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<SimilarMoviesPage> createState() => _SimilarMoviesPageState();
}

class _SimilarMoviesPageState extends State<SimilarMoviesPage> {
  ApiServices apiServices = ApiServices();
  late Future<Result> similarMoviesFuture;

  @override
  void initState() {
    similarMoviesFuture = apiServices.getSimilarMovies(widget.movie.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Similar Movies'),
      ),
      body: FutureBuilder(
          future: similarMoviesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            if (snapshot.hasData) {
              final movies = snapshot.data!.movies;
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return SimilarMovie(movie: movies[index]);
                },
              );
            }

            return const Center(
              child: Text('No data found'),
            );
          }),
    );
  }
}
