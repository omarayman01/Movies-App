import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/repos/home/home_repo.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.homeRepo) : super(PopularMoviesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchPopularMovies() async {
    emit(PopularMoviesLoading());
    var result = await homeRepo.fetchNewReleasesMovies();
    result.fold(
        (faliure) => emit(PopularMoviesFailure(errMessage: faliure.errMessage)),
        (movies) {
      emit(PopularMoviesSuccess(movies: movies));
    });
  }
}
