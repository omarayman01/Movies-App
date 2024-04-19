import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view/app_theme.dart';
import 'package:movies_app/view/core/widgets/movie_item.dart';
import 'package:movies_app/view/core/widgets/poster_item.dart';
import 'package:movies_app/view/features/details/widgets/similarmovies_listview.dart';
import 'package:movies_app/view_model/cubits/details_cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies_app/view_model/cubits/details_cubits/similar_movies_cubit/similar_movies_cubit.dart';
import 'package:movies_app/view_model/repos/details/details_repo_impl.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieModel movie =
        ModalRoute.of(context)!.settings.arguments as MovieModel;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => SimilarMoviesCubit(
                DetailsRepoImpl(id: movie.id.toString()), movie.id.toString())
              ..fetchSimilarMovies()),
        BlocProvider(
            create: (context) => MovieDetailsCubit(
                DetailsRepoImpl(id: movie.id.toString()), movie.id.toString())
              ..fetchMovieDetails()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            movie.title!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppTheme.white,
            ), // Custom icon
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: AppTheme.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 250,
                width: double.infinity,
                child: PosterItem(
                  movie: movie,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
              child: Text(
                movie.title!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 0),
              child: Text(
                movie.releaseDate!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
              child: Row(
                children: [
                  SizedBox(
                      width: 100,
                      height: 150,
                      child: MovieItem(
                        movie: movie,
                      )),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 35,
                          height: 15,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppTheme.bckGround)),
                          child: Center(
                            child: Text(
                              'Action',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 8),
                            ),
                          )),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 230,
                        child: Text(
                            softWrap: true,
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                            movie.overview!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 10)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage('assets/pics/star-2.png'),
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(movie.voteAverage.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 170,
              child: SimilarMoviesListView(text: 'More like This'),
            )
          ],
        ),
      ),
    );
  }
}
