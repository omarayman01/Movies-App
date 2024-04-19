import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';

class MovieDisc extends StatelessWidget {
  const MovieDisc({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage('assets/pics/star-2.png'),
              ),
              const SizedBox(
                width: 5,
              ),
              Text('${movie.voteAverage}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 8)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 19),
          child: Text('${movie.originalTitle}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 8)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 19),
          child: Text('${movie.releaseDate}',
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 6)),
        ),
      ],
    );
  }
}
