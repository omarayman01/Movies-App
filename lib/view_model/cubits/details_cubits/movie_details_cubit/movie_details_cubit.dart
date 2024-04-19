import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/repos/details/details_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.detailsRepo, this.id) : super(MovieDetailsInitial());
  final DetailsRepo detailsRepo;
  final String id;
  Future<void> fetchMovieDetails() async {
    emit(MovieDetailsLoading());
    var result = await detailsRepo.fetchMovieDetails(id);
    result.fold(
        (faliure) => emit(MovieDetailsFailure(errMessage: faliure.errMessage)),
        (movies) {
      emit(MovieDetailsSuccess(movie: movies));
    });
  }
}
