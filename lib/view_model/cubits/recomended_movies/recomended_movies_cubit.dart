import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/repos/home_repo.dart';

part 'recomended_movies_state.dart';

class RecomendedMoviesCubit extends Cubit<RecomendedMoviesState> {
  RecomendedMoviesCubit(this.homeRepo) : super(RecomendedMoviesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewReleasesMovies() async {
    emit((RecomendedMoviesLoading()));
    var result = await homeRepo.fetchNewReleasesMovies();
    result.fold(
        (faliure) =>
            emit(RecomendedMoviesFailure(errMessage: faliure.errMessage)),
        (movies) {
      emit(RecomendedMoviesSuccess(movies: movies));
    });
  }
}
