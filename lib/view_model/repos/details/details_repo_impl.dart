import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/database/network/dio_helper.dart';
import 'package:movies_app/view_model/database/network/end_point.dart';
import 'package:movies_app/view_model/errors/failures.dart';
import 'package:movies_app/view_model/repos/details/details_repo.dart';

class DetailsRepoImpl implements DetailsRepo {
  final String id;

  DetailsRepoImpl({required this.id});
  @override
  Future<Either<Faliure, MovieModel>> fetchMovieDetails(String id) async {
    debugPrint("REPOOOOOOOOOOOOOOOOOOOOO");

    try {
      var data = await DioHelper.getData(
          endPoint: "movie/$id", token: EndPoints.accessToken);
      debugPrint(data.toString());

      return right(MovieModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, List<MovieModel>>> fetchSimilarMovies(
      String id) async {
    debugPrint("INNNNNN");

    try {
      debugPrint("tryyyy");

      var data = await DioHelper.getData(
          endPoint: "/movie/${id}/similar", token: EndPoints.accessToken);
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
