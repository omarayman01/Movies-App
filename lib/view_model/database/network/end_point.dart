class EndPoints {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '48dff3e1d9a49daadca1ef98a6a71533';
  static const String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OGRmZjNlMWQ5YTQ5ZGFhZGNhMWVmOThhNmE3MTUzMyIsInN1YiI6IjY2MWU5YmVhMjBhZjc3MDE2NDNkODYzNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Bbc8uAbfA87b6D1DGzKKez_ciGhjMIIBHJADRGG9m1I';
  static const String popularMovies = '/movie-popular-list';
  static const String detailsMovie = '/movie/';
  static const String similarMovies = 'movie/{movie_id}/similar';
  static const String newReleasesMovies = '/movie/upcoming';
  static const String recomendedMovies = '/movie/top_rated';
}
