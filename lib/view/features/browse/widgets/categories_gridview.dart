import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/view/features/browse/views/browse_movies_screen.dart';
import 'package:movies_app/view_model/cubits/browse_category/browse_category/browse_category_cubit.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseCategoryCubit, BrowseCategoryState>(
      builder: (context, state) {
        if (state is BrowseCategorySuccess) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 10,
                childAspectRatio: 2.8 / 2),
            itemCount: 19,
            itemBuilder: (BuildContext context, index) {
              return Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BrowseMoviesScreen(
                            movieCategory:
                                state.categories[index].id!.toString(),
                            category: state.categories[index].name!,
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      child: Image.asset('assets/pics/Image2.png'),
                    ),
                  ),
                  Center(
                    child: Text(
                      state.categories[index].name!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              );
            },
          );
        } else if (state is BrowseCategoryFailure) {
          return Text(state.errMessage,
              style: Theme.of(context).textTheme.bodyLarge);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
