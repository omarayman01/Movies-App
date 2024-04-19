import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movies_app/model/category/category.model.dart';
import 'package:movies_app/view_model/repos/browse/browse_repo.dart';

part 'browse_category_state.dart';

class BrowseCategoryCubit extends Cubit<BrowseCategoryState> {
  BrowseCategoryCubit(this.browseRepo) : super(BrowseCategoryInitial());
  final BrowseRepo browseRepo;
  Future<void> fetchCategories() async {
    emit(BrowseCategoryLoading());
    var result = await browseRepo.fetchCategories();
    result.fold(
        (faliure) =>
            emit(BrowseCategoryFailure(errMessage: faliure.errMessage)),
        (movies) {
      print(movies);
      emit(BrowseCategorySuccess(categories: movies));
    });
  }
}
