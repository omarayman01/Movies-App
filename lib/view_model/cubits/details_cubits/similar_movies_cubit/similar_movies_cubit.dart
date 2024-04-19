import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/repos/details/details_repo.dart';

part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit(this.detailsRepo, this.id) : super(SimilarMoviesInitial());
  final DetailsRepo detailsRepo;
  final String id;
  Future<void> fetchSimilarMovies() async {
    emit(SimilarMoviesLoading());
    var result = await detailsRepo.fetchSimilarMovies(id);
    result.fold(
        (faliure) => emit(SimilarMoviesFailure(errMessage: faliure.errMessage)),
        (movies) {
      emit(SimilarMoviesSuccess(movies: movies));
    });
  }
}
