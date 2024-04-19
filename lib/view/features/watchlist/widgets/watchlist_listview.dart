import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view/features/search/widgets/search_item.dart';
import 'package:movies_app/view/features/watchlist/widgets/whatlist_item.dart';
import 'package:movies_app/view_model/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    Set<MovieModel> uniqueSet = moviesProvider.movies.toSet();
    List<MovieModel> movies = uniqueSet.toList();
    return ListView.builder(
      itemCount: movies.length,
      // itemCount: 2,

      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: WatchListItem(movie: movies[index]),
        );
      },
    );
  }
}
