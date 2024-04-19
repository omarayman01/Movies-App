part of 'new_releases_movies_cubit.dart';

sealed class NewReleasesMoviesState extends Equatable {
  const NewReleasesMoviesState();

  @override
  List<Object> get props => [];
}

final class NewReleasesMoviesInitial extends NewReleasesMoviesState {}

final class NewReleasesMoviesLoading extends NewReleasesMoviesState {}

final class NewReleasesMoviesSuccess extends NewReleasesMoviesState {
  final List<MovieModel> movies;

  const NewReleasesMoviesSuccess({required this.movies});
}

final class NewReleasesMoviesFailure extends NewReleasesMoviesState {
  final String errMessage;

  const NewReleasesMoviesFailure({required this.errMessage});
}
