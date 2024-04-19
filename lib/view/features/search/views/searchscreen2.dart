import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/view/app_theme.dart';
import 'package:movies_app/view/features/search/views/search_screen.dart';
import 'package:movies_app/view/features/search/widgets/search_listview.dart';
import 'package:movies_app/view_model/cubits/search_category/search_cubit.dart';
import 'package:movies_app/view_model/repos/search/search_repo_impl.dart';

class SearchScreen2 extends StatelessWidget {
  const SearchScreen2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => SearchCubit(SearchRepoImpl())
                ..fetchMovieBySearchhh(enteredText)),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              enteredText,
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
            backgroundColor: AppTheme.primary,
          ),
          body: Padding(
            padding: EdgeInsets.all(19),
            child: Column(
              children: [
                // const SizedBox(
                //   height: 250,
                // ),
                Expanded(child: SearchListView()),
                // Center(child: Image.asset('assets/pics/Group 22.png'))
              ],
            ),
          ),
        ));
  }
}
