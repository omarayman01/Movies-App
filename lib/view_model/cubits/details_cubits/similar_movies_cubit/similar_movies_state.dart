part of 'similar_movies_cubit.dart';

sealed class SimilarMoviesState extends Equatable {
  const SimilarMoviesState();

  @override
  List<Object> get props => [];
}

final class SimilarMoviesInitial extends SimilarMoviesState {}

final class SimilarMoviesLoading extends SimilarMoviesState {}

final class SimilarMoviesSuccess extends SimilarMoviesState {
  final List<MovieModel> movies;

  const SimilarMoviesSuccess({required this.movies});
}

final class SimilarMoviesFailure extends SimilarMoviesState {
  final String errMessage;

  const SimilarMoviesFailure({required this.errMessage});
}
