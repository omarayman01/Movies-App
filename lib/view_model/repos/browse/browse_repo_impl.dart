import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/category/category.model.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/database/network/dio_helper.dart';
import 'package:movies_app/view_model/database/network/end_point.dart';
import 'package:movies_app/view_model/errors/failures.dart';
import 'package:movies_app/view_model/repos/browse/browse_repo.dart';

class BrowseRepoImpl implements BrowseRepo {
  @override
  Future<Either<Faliure, List<CategoryModel>>> fetchCategories() async {
    try {
      debugPrint("tryyyyCategories");

      var data = await DioHelper.getData(
          endPoint: "/genre/movie/list", token: EndPoints.accessToken);
      // debugPrint(data.toString());
      List<CategoryModel> categories = [];

      for (var item in data.data['genres']) {
        categories.add(CategoryModel.fromJson(item));
        debugPrint(item.toString());
        debugPrint(222222.toString());
      }
      debugPrint(categories.toString());

      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, List<MovieModel>>> fetchMoviesByCategory(
      String movieCategory) async {
    try {
      debugPrint("tryyyySearch");

      var data = await DioHelper.getData(
          endPoint: "/discover/movie?with_genres=$movieCategory",
          token: EndPoints.accessToken);
      debugPrint(data.toString());
      List<MovieModel> movies = [];

      for (var item in data.data['results']) {
        movies.add(MovieModel.fromJson(item));
      }

      debugPrint(movies.toString());
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
