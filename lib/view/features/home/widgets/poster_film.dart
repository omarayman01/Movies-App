import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/view/core/widgets/movie_item.dart';
import 'package:movies_app/view/core/widgets/poster_item.dart';
import 'package:movies_app/view_model/cubits/home_cubits/popular_movies_cubit/popular_movies_cubit.dart';
import 'dart:math';

class PosterFilm extends StatelessWidget {
  const PosterFilm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesSuccess) {
          Random random = Random();
          int min = 0;
          int max = state.movies.length;
          int randomNumber = min + random.nextInt(max - min);
          return Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      child: PosterItem(movie: state.movies[randomNumber])),
                  Row(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 150,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child:
                                  MovieItem(movie: state.movies[randomNumber]),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 250,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                softWrap: true,
                                state.movies[randomNumber].title.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              state.movies[randomNumber].releaseDate.toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          );
        } else if (state is PopularMoviesFailure) {
          return Text(state.errMessage,
              style: Theme.of(context).textTheme.bodyLarge);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
