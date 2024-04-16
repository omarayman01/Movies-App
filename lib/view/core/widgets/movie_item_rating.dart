import 'package:flutter/material.dart';
import 'package:movies_app/view/app_theme.dart';
import 'package:movies_app/view/constants.dart';
import 'package:movies_app/view/core/widgets/movie_disc.dart';

class MovieItemRating extends StatefulWidget {
  const MovieItemRating({
    super.key,
  });

  @override
  State<MovieItemRating> createState() => _MovieItemRatingState();
}

class _MovieItemRatingState extends State<MovieItemRating> {
  bool isSaved = false;
  String img = 'assets/pics/bookmark.png';
  String img2 = 'assets/pics/bookmarksaved.png';
  String res = '';
  @override
  Widget build(BuildContext context) {
    if (isSaved) {
      res = img2;
    } else {
      res = img;
    }
    return Card(
      elevation: 10, // Adjust the elevation as needed
      child: Container(
          width: 80,
          height: 130,
          color: AppTheme.bckGround,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.detailsRoute);
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            color: AppTheme.bckGround,
                            borderRadius: BorderRadius.circular(0),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/pics/Image.png'))),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          isSaved = !isSaved;
                          setState(() {});
                        },
                        child: Image(image: AssetImage(res)))
                  ],
                ),
              ),
              const MovieDisc(),
            ],
          )),
    );
  }
}
