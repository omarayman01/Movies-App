import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/repos/home/home_repo.dart';

part 'new_releases_movies_state.dart';

class NewReleasesMoviesCubit extends Cubit<NewReleasesMoviesState> {
  NewReleasesMoviesCubit(this.homeRepo) : super(NewReleasesMoviesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewReleasesMovies() async {
    emit(NewReleasesMoviesLoading());
    var result = await homeRepo.fetchNewReleasesMovies();
    result.fold(
        (faliure) =>
            emit(NewReleasesMoviesFailure(errMessage: faliure.errMessage)),
        (movies) {
      emit(NewReleasesMoviesSuccess(movies: movies));
    });
  }
}
