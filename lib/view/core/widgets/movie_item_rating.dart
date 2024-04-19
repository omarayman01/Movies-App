import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view/app_theme.dart';
import 'package:movies_app/view/constants.dart';
import 'package:movies_app/view/core/widgets/movie_disc.dart';
import 'package:movies_app/view_model/database/firebase/firebase_utils.dart';
import 'package:movies_app/view_model/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieItemRating extends StatefulWidget {
  const MovieItemRating({
    super.key,
    required this.movie,
  });
  final MovieModel movie;
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
                        Navigator.pushNamed(context, Routes.detailsRoute,
                            arguments: widget.movie);
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            color: AppTheme.bckGround,
                            borderRadius: BorderRadius.circular(0),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    '$imgUrl${widget.movie.backdropPath}'))),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          if (!isSaved) {
                            addTask();
                          }
                          isSaved = !isSaved;
                          setState(() {});
                        },
                        child: Image(image: AssetImage(res)))
                  ],
                ),
              ),
              MovieDisc(
                movie: widget.movie,
              ),
            ],
          )),
    );
  }

  void addTask() {
    FireBaseUtils.addmovieToFireStore(widget.movie).timeout(
      const Duration(milliseconds: 5),
      onTimeout: () {
        // Navigator.pop(context);
        Provider.of<MoviesProvider>(context, listen: false).getTasks();
      },
    ).catchError((error) {
      print(error.toString());
    });
  }
}
