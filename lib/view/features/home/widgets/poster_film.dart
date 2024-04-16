import 'package:flutter/material.dart';
import 'package:movies_app/view/core/widgets/movie_item.dart';
import 'package:movies_app/view/core/widgets/poster_item.dart';

class PosterFilm extends StatelessWidget {
  const PosterFilm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: const PosterItem()),
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
                          height: MediaQuery.of(context).size.height * 0.23,
                          child: const MovieItem()),
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
                      Text(
                        'Dora and the lost city of gold',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '2019  PG-13  2h 7m',
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
  }
}
