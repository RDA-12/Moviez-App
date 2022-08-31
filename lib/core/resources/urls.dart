class Urls {
  final String _baseUrl = "https://imdb-api.com/en/API";
  final String _imdbAPIKey = "k_jbtwakqc";

  String getTopMoviesUrl() {
    return "$_baseUrl/Top250Movies/$_imdbAPIKey";
  }

  String getInTheaterMoviesUrl() {
    return "$_baseUrl/InTheaters/$_imdbAPIKey";
  }

  String getPopularMoviesUrl() {
    return "$_baseUrl/MostPopularMovies/$_imdbAPIKey";
  }

  String getBoxOfficeMoviesUrl() {
    return "$_baseUrl/BoxOffice/$_imdbAPIKey";
  }

  String getMovieDetailUrl(String movieId) {
    return "$_baseUrl/Title/$_imdbAPIKey/$movieId";
  }

  String getMovieTrailerUrl(String movieId) {
    return "$_baseUrl/YouTubeTrailer/$_imdbAPIKey/$movieId";
  }
}

final Urls urls = Urls();
