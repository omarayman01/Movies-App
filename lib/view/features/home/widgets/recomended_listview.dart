import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/view/app_theme.dart';
import 'package:movies_app/view/core/widgets/movie_item_rating.dart';
import 'package:movies_app/view_model/cubits/home_cubits/recomended_movies/recomended_movies_cubit.dart';

class RecomendedListView extends StatelessWidget {
  const RecomendedListView({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecomendedMoviesCubit, RecomendedMoviesState>(
      builder: (context, state) {
        if (state is RecomendedMoviesSuccess) {
          return Container(
            color: AppTheme.bckGround,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 19, top: 10, bottom: 10),
                  child:
                      Text(text, style: Theme.of(context).textTheme.bodyLarge),
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.movies.length,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 19, bottom: 8),
                          child: MovieItemRating(
                            movie: state.movies[index],
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        } else if (state is RecomendedMoviesFailure) {
          return Text(state.errMessage,
              style: Theme.of(context).textTheme.bodyLarge);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
