class FavoriteMovies {
  static final FavoriteMovies _instance = FavoriteMovies._internal();

  factory FavoriteMovies() {
    return _instance;
  }

  FavoriteMovies._internal();

  List<String> favoriteMoviesList = [];

  void addMovie(String movieTitle) {
    if (!favoriteMoviesList.contains(movieTitle)) {
      favoriteMoviesList.add(movieTitle);
    }
  }

  void removeMovie(String movieTitle) {
    favoriteMoviesList.remove(movieTitle);
  }

  bool isFavorited(String movieTitle) {
    return favoriteMoviesList.contains(movieTitle);
  }

  void printFavorites() {
    print(favoriteMoviesList);
  }
}
