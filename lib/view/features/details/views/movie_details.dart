import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/view/app_theme.dart';
import 'package:movies_app/view/core/widgets/movie_item.dart';
import 'package:movies_app/view/core/widgets/movie_item_rating.dart';
import 'package:movies_app/view/core/widgets/poster_item.dart';
import 'package:movies_app/view/features/home/widgets/movies_listview.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dora and the lost city of gold',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.white,
          ), // Custom icon
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: AppTheme.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
              height: 250, width: double.infinity, child: PosterItem()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
            child: Text(
              'Dora and the lost city of gold',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 0),
            child: Text(
              '2019  PG-13  2h 7m',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
            child: Row(
              children: [
                const SizedBox(height: 150, child: MovieItem()),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 35,
                        height: 20,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.bckGround)),
                        child: Center(
                          child: Text(
                            'Action',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 8),
                          ),
                        )),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: Text(
                          softWrap: true,
                          "Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Image(
                          image: AssetImage('assets/pics/star-2.png'),
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('7.7',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 15)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 180,
            child: MoviesListView(
                text: 'More Like This', widget: MovieItemRating()),
          )
        ],
      ),
    );
  }
}
