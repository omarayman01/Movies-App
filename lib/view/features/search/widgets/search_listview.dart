import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/view/features/search/widgets/search_item.dart';
import 'package:movies_app/view_model/cubits/search_category/search_cubit.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              return SearchItem(
                movie: state.movies[index],
              );
            },
          );
        } else if (state is SearchFailure) {
          return Text(state.errMessage,
              style: Theme.of(context).textTheme.bodyLarge);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
