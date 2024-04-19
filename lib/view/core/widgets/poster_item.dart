import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view/constants.dart';

class PosterItem extends StatelessWidget {
  const PosterItem({
    super.key,
    required this.movie,
  });
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: 2 / 4,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('$imgUrl${movie.backdropPath}'))),
            ),
            const Center(
                child:
                    Image(image: AssetImage('assets/pics/play-button-2.png')))
          ],
        ),
      ),
    );
  }
}
