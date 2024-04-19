part of 'recomended_movies_cubit.dart';

sealed class RecomendedMoviesState extends Equatable {
  const RecomendedMoviesState();

  @override
  List<Object> get props => [];
}

final class RecomendedMoviesInitial extends RecomendedMoviesState {}

final class RecomendedMoviesLoading extends RecomendedMoviesState {}

final class RecomendedMoviesSuccess extends RecomendedMoviesState {
  final List<MovieModel> movies;

  const RecomendedMoviesSuccess({required this.movies});
}

final class RecomendedMoviesFailure extends RecomendedMoviesState {
  final String errMessage;

  const RecomendedMoviesFailure({required this.errMessage});
}
