import 'package:flutter/material.dart';
import 'package:movies_app/view/features/home/widgets/newreleases_listview.dart';
import 'package:movies_app/view/features/home/widgets/poster_film.dart';
import 'package:movies_app/view/features/home/widgets/recomended_listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PosterFilm(),
        SizedBox(height: 20),
        SizedBox(
          height: 155,
          child: NewReleasesListView(
            text: "New Releases",
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
            height: 180,
            child: RecomendedListView(
              text: 'Recomended',
            )),
      ],
    ));
  }
}
