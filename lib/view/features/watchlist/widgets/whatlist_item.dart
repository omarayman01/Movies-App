import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view/app_theme.dart';
import 'package:movies_app/view/constants.dart';
import 'package:movies_app/view_model/database/firebase/firebase_utils.dart';
import 'package:movies_app/view_model/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class WatchListItem extends StatefulWidget {
  const WatchListItem({super.key, required this.movie});
  final MovieModel movie;

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              // height: 100,
              width: 200,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.detailsRoute);
                    },
                    // child: Image(
                    //   image: AssetImage('assets/pics/Image2.png'),
                    // ),
                    child: Image(
                      image:
                          NetworkImage('$imgUrl${widget.movie.backdropPath}'),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        delete();
                        setState(() {});
                      },
                      child: Icon(
                        Icons.cancel_presentation_sharp,
                        color: AppTheme.white,
                      ))
                ],
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    softWrap: true,
                    widget.movie.title.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(widget.movie.releaseDate.toString(),
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
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

  void delete() {
    FireBaseUtils.deletemovieFromFireStore(widget.movie).timeout(
      const Duration(milliseconds: 5),
      onTimeout: () {
        Provider.of<MoviesProvider>(context, listen: false).getTasks();
      },
    ).catchError((error) {
      // print(error.toString());
    });
  }
}
