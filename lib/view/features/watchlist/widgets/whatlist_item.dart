import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/view/app_theme.dart';
import 'package:movies_app/view/constants.dart';

class WatchListItem extends StatefulWidget {
  const WatchListItem({super.key});

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
  bool isSaved = true;
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
    return Column(
      children: [
        Row(
          children: [
            Stack(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.detailsRoute);
                    },
                    child: Image(image: AssetImage('assets/pics/pic.png'))),
                InkWell(
                    onTap: () {
                      isSaved = !isSaved;
                      setState(() {});
                    },
                    child: Image(image: AssetImage(res)))
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alita Battle Angel',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text('2019', style: Theme.of(context).textTheme.bodySmall),
                Text('Rosa Salazar, Christoph Waltz',
                    style: Theme.of(context).textTheme.bodySmall)
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
