import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/repos/search/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchMovieBySearchhh(String movieName) async {
    debugPrint('success return cubitt');

    emit(SearchLoading());
    var result = await searchRepo.fetchMovieBySearch(movieName);
    debugPrint('searchCubittttttttttt');

    debugPrint(result.toString());
    result
        .fold((faliure) => emit(SearchFailure(errMessage: faliure.errMessage)),
            (movies) {
      debugPrint('success return cubitt');
      emit(SearchSuccess(movies: movies));
    });
  }

  void resetSearch() {
    debugPrint('initial return cubitt');
    // fetchMovieBySearchhh(movieName);
  }
}
