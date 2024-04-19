import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/database/network/dio_helper.dart';
import 'package:movies_app/view_model/database/network/end_point.dart';
import 'package:movies_app/view_model/errors/failures.dart';
import 'package:movies_app/view_model/repos/home/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Faliure, List<MovieModel>>> fetchNewReleasesMovies() async {
    try {
      var data = await DioHelper.getData(
          endPoint: EndPoints.newReleasesMovies, token: EndPoints.accessToken);
      // debugPrint(data.toString());
      List<MovieModel> movies = [];
      for (var item in data.data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, List<MovieModel>>> fetchRecomendedMovies() async {
    try {
      var data = await DioHelper.getData(
          endPoint: EndPoints.recomendedMovies, token: EndPoints.accessToken);
      List<MovieModel> movies = [];
      for (var item in data.data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, List<MovieModel>>> fetchPopularMovies() async {
    try {
      var data = await DioHelper.getData(
          endPoint: EndPoints.popularMovies, token: EndPoints.accessToken);
      List<MovieModel> movies = [];
      for (var item in data.data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
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
