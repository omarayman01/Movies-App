part of 'browse_category_movies_cubit.dart';

sealed class BrowseCategoryMoviesState extends Equatable {
  const BrowseCategoryMoviesState();

  @override
  List<Object> get props => [];
}

final class BrowseCategoryMoviesInitial extends BrowseCategoryMoviesState {}

final class BrowseCategoryMoviesLoading extends BrowseCategoryMoviesState {}

final class BrowseCategoryMoviesSuccess extends BrowseCategoryMoviesState {
  final List<MovieModel> movies;

  const BrowseCategoryMoviesSuccess({required this.movies});
}

final class BrowseCategoryMoviesFailure extends BrowseCategoryMoviesState {
  final String errMessgae;

  const BrowseCategoryMoviesFailure({required this.errMessgae});
}
