import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/database/network/dio_helper.dart';
import 'package:movies_app/view_model/database/network/end_point.dart';
import 'package:movies_app/view_model/errors/failures.dart';
import 'package:movies_app/view_model/repos/search/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either<Faliure, List<MovieModel>>> fetchMovieBySearch(
      String movieName) async {
    try {
      // debugPrint("tryyyySearch");

      var data = await DioHelper.getData(
          endPoint: "/search/movie?query=$movieName",
          token: EndPoints.accessToken);
      // debugPrint(data.toString());
      List<MovieModel> movies = [];

      for (var item in data.data['results']) {
        if (MovieModel.fromJson(item).backdropPath != null &&
            MovieModel.fromJson(item).releaseDate != null &&
            MovieModel.fromJson(item).title != null) {
          movies.add(MovieModel.fromJson(item));
        }
      }
      debugPrint("Repoooooooooimpll");

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
