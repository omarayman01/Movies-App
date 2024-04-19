import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/view/app_theme.dart';
import 'package:movies_app/view/features/search/views/searchscreen2.dart';
import 'package:movies_app/view/features/search/widgets/search_listview.dart';
import 'package:movies_app/view/features/search/widgets/search_textformfeild.dart';
import 'package:movies_app/view_model/cubits/search_category/search_cubit.dart';
import 'package:movies_app/view_model/repos/search/search_repo_impl.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => SearchCubit(SearchRepoImpl())
              ..fetchMovieBySearchhh(enteredText))
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(19),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppTheme.bckGround,
                  border: Border.all(
                    color: AppTheme.bckGround,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    onChanged: (value) {
                      enteredText = value;

                      print(enteredText);
                    },
                    controller: controller,
                    style: TextStyle(color: AppTheme.white),
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchScreen2(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.check,
                          color: AppTheme.white,
                          size: 28,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppTheme.white,
                        size: 28,
                      ),
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              // const Expanded(child: SearchListView()),
              Center(child: Image.asset('assets/pics/Group 22.png'))
            ],
          ),
        ),
      ),
    );
  }
}

String enteredText = '';
