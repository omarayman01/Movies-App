import 'package:dartz/dartz.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/errors/failures.dart';

abstract class SearchRepo {
  Future<Either<Faliure, List<MovieModel>>> fetchMovieBySearch(
      String movieName);
}
