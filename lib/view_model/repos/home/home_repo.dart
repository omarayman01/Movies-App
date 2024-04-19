import 'package:dartz/dartz.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Faliure, List<MovieModel>>> fetchRecomendedMovies();
  Future<Either<Faliure, List<MovieModel>>> fetchNewReleasesMovies();
  Future<Either<Faliure, List<MovieModel>>> fetchPopularMovies();
}
