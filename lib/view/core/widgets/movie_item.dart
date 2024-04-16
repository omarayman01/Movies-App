import 'package:flutter/material.dart';
import 'package:movies_app/view/app_theme.dart';
import 'package:movies_app/view/constants.dart';

class MovieItem extends StatefulWidget {
  const MovieItem({
    super.key,
  });

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
                Navigator.pushNamed(context, Routes.detailsRoute);
              },
              child: Container(
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
    );
  }
}
