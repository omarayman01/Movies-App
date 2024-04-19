import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/view/features/browse/widgets/categories_gridview.dart';
import 'package:movies_app/view_model/cubits/browse_category/browse_category/browse_category_cubit.dart';
import 'package:movies_app/view_model/repos/browse/browse_repo_impl.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BrowseCategoryCubit(BrowseRepoImpl())..fetchCategories(),
        ),
      ],
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 10),
          Text(
            'Browse Category',
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
          ),
          const Expanded(child: CategoriesGridView())
        ]),
      )),
    );
  }
}
