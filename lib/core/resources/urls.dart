class Urls {
  // TODO: use dart-define
  final String _imdbApiBaseUrl = "https://imdb-api.com/en/API";
  final String _newsApiBaseUrl = "https://newsapi.org/v2/everything";
  final String _imdbAPIKey = "k_jbtwakqc";
  final String _newsAPIKey = "67b2949c77c541659723b81292d29882";

  String getTopMoviesUrl() {
    return "$_imdbApiBaseUrl/Top250Movies/$_imdbAPIKey";
  }

  String getInTheaterMoviesUrl() {
    return "$_imdbApiBaseUrl/InTheaters/$_imdbAPIKey";
  }

  String getPopularMoviesUrl() {
    return "$_imdbApiBaseUrl/MostPopularMovies/$_imdbAPIKey";
  }

  String getBoxOfficeMoviesUrl() {
    return "$_imdbApiBaseUrl/BoxOffice/$_imdbAPIKey";
  }

  String getMovieDetailUrl(String movieId) {
    return "$_imdbApiBaseUrl/Title/$_imdbAPIKey/$movieId";
  }

  String getMovieTrailerUrl(String movieId) {
    return "$_imdbApiBaseUrl/YouTubeTrailer/$_imdbAPIKey/$movieId";
  }

  String getNewsUrl(String page) {
    return "$_newsApiBaseUrl?q=movies&sortBy=relevancy&page=$page&apikey=$_newsAPIKey";
  }
}

final Urls urls = Urls();
