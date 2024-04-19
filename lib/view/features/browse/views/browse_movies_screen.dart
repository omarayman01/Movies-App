import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/view/app_theme.dart';
import 'package:movies_app/view/features/browse/widgets/category_movies_listview.dart';
import 'package:movies_app/view/features/search/views/search_screen.dart';
import 'package:movies_app/view/features/search/widgets/search_item.dart';
import 'package:movies_app/view_model/cubits/browse_category/browse_category_movies/browse_category_movies_cubit.dart';
import 'package:movies_app/view_model/repos/browse/browse_repo_impl.dart';

class BrowseMoviesScreen extends StatelessWidget {
  const BrowseMoviesScreen(
      {super.key, required this.movieCategory, required this.category});
  final String movieCategory;
  final String category;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BrowseCategoryMoviesCubit(BrowseRepoImpl())
            ..fetchMovieBySearch(movieCategory),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            category,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
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
          backgroundColor: AppTheme.primary,
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(child: CategoryMoviesListView()),
            ],
          ),
        ),
      ),
    );
  }
}
