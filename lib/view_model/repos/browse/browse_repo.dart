import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:movies_app/model/category/category.model.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/errors/failures.dart';

abstract class BrowseRepo {
  Future<Either<Faliure, List<CategoryModel>>> fetchCategories();
  Future<Either<Faliure, List<MovieModel>>> fetchMoviesByCategory(
      String movieCategory);
}
