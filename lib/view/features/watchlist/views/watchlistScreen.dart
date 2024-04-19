import 'package:flutter/material.dart';
import 'package:movies_app/view/features/watchlist/widgets/watchlist_listview.dart';
import 'package:movies_app/view_model/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider()..getTasks(),
        ),
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                'Watchlist',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 24),
              ),
              const Expanded(child: WatchListView()),
            ],
          ),
        ),
      ),
    );
  }
}
