import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view/app_theme.dart';
import 'package:movies_app/view/constants.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.detailsRoute,
                      arguments: movie);
                },
                child: SizedBox(
                  width: 170,
                  height: 200,
                  child: Image(
                      image: NetworkImage('$imgUrl${movie.backdropPath!}')),
                )),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 140,
                  child: Text(
                    softWrap: true,
                    movie.title!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Text(movie.releaseDate!,
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            )
          ],
        ),
        Divider(
          color: AppTheme.bckGround,
          thickness: 3,
        )
      ],
    );
  }
}
