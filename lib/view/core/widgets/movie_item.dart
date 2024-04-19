import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view/app_theme.dart';
import 'package:movies_app/view/constants.dart';
import 'package:movies_app/view_model/database/firebase/firebase_utils.dart';
import 'package:movies_app/view_model/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieItem extends StatefulWidget {
  const MovieItem({
    super.key,
    required this.movie,
  });
  final MovieModel movie;
  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
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
    return GestureDetector(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: 3.1 / 4,
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.detailsRoute,
                    arguments: widget.movie);
              },
              child: Container(
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
    );
  }

  void addTask() {
    FireBaseUtils.addmovieToFireStore(widget.movie).timeout(
      const Duration(milliseconds: 5),
      onTimeout: () {
        Provider.of<MoviesProvider>(context, listen: false).getTasks();
      },
    ).catchError((error) {
      print(error.toString());
    });
  }
}
