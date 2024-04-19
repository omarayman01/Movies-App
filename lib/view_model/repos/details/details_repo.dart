import 'package:dartz/dartz.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/errors/failures.dart';

abstract class DetailsRepo {
  Future<Either<Faliure, MovieModel>> fetchMovieDetails(String id);
  Future<Either<Faliure, List<MovieModel>>> fetchSimilarMovies(String id);
}
