part of 'browse_category_cubit.dart';

sealed class BrowseCategoryState extends Equatable {
  const BrowseCategoryState();

  @override
  List<Object> get props => [];
}

final class BrowseCategoryInitial extends BrowseCategoryState {}

final class BrowseCategoryLoading extends BrowseCategoryState {}

final class BrowseCategorySuccess extends BrowseCategoryState {
  final List<CategoryModel> categories;

  const BrowseCategorySuccess({required this.categories});
}

final class BrowseCategoryFailure extends BrowseCategoryState {
  final String errMessage;

  const BrowseCategoryFailure({required this.errMessage});
}
