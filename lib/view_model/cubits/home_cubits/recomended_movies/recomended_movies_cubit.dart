import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/repos/home/home_repo.dart';

part 'recomended_movies_state.dart';

class RecomendedMoviesCubit extends Cubit<RecomendedMoviesState> {
  RecomendedMoviesCubit(this.homeRepo) : super(RecomendedMoviesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchRecomendedMovies() async {
    emit((RecomendedMoviesLoading()));
    var result = await homeRepo.fetchRecomendedMovies();
    result.fold(
        (faliure) =>
            emit(RecomendedMoviesFailure(errMessage: faliure.errMessage)),
        (movies) {
      emit(RecomendedMoviesSuccess(movies: movies));
    });
  }
}
