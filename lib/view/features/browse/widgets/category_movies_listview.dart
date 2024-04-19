import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/view/features/search/widgets/search_item.dart';
import 'package:movies_app/view_model/cubits/browse_category/browse_category_movies/browse_category_movies_cubit.dart';

class CategoryMoviesListView extends StatelessWidget {
  const CategoryMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseCategoryMoviesCubit, BrowseCategoryMoviesState>(
      builder: (context, state) {
        if (state is BrowseCategoryMoviesSuccess) {
          return ListView.builder(
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              return SearchItem(
                movie: state.movies[index],
              );
            },
          );
        } else if (state is BrowseCategoryMoviesFailure) {
          return Text(state.errMessgae,
              style: Theme.of(context).textTheme.bodyLarge);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
