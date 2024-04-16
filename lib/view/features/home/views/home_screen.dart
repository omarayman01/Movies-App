import 'package:flutter/material.dart';
import 'package:movies_app/view/core/widgets/movie_item.dart';
import 'package:movies_app/view/core/widgets/movie_item_rating.dart';
import 'package:movies_app/view/features/home/widgets/movies_listView.dart';
import 'package:movies_app/view/features/home/widgets/poster_film.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PosterFilm(),
        SizedBox(height: 20),
        SizedBox(
            height: 155,
            child: MoviesListView(
              text: 'New Releases',
              widget: MovieItem(),
            )),
        SizedBox(height: 20),
        SizedBox(
            height: 180,
            child: MoviesListView(
              text: 'Recomended',
              widget: MovieItemRating(),
            )),
      ],
    ));
  }
}
