import 'package:flutter/material.dart';
import 'package:movies_app/view/features/watchlist/widgets/whatlist_item.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: WatchListItem(),
        );
      },
    );
  }
}
