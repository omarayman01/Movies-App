import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/repos/browse/browse_repo.dart';

part 'browse_category_movies_state.dart';

class BrowseCategoryMoviesCubit extends Cubit<BrowseCategoryMoviesState> {
  BrowseCategoryMoviesCubit(this.browseRepo)
      : super(BrowseCategoryMoviesInitial());
  final BrowseRepo browseRepo;
  Future<void> fetchMovieBySearch(String movieCategory) async {
    emit(BrowseCategoryMoviesLoading());
    var result = await browseRepo.fetchMoviesByCategory(movieCategory);
    result.fold(
        (faliure) =>
            emit(BrowseCategoryMoviesFailure(errMessgae: faliure.errMessage)),
        (movies) {
      emit(BrowseCategoryMoviesSuccess(movies: movies));
    });
  }
}
