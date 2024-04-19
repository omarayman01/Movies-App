import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:movies_app/view/app_theme.dart';
import 'package:movies_app/view/constants.dart';
import 'package:movies_app/view/features/base.dart';
import 'package:movies_app/view/features/details/views/movie_details.dart';
import 'package:movies_app/view_model/cubits/home_cubits/new_releases_cubit/new_releases_movies_cubit.dart';
import 'package:movies_app/view_model/cubits/home_cubits/popular_movies_cubit/popular_movies_cubit.dart';

import 'package:movies_app/view_model/database/network/dio_helper.dart';
import 'package:movies_app/view_model/repos/home/home_repo_impl.dart';

import 'view_model/cubits/home_cubits/recomended_movies/recomended_movies_cubit.dart';

void main() async {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.disableNetwork;
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              NewReleasesMoviesCubit(HomeRepoImpl())..fetchNewReleasesMovies(),
        ),
        BlocProvider(
          create: (context) =>
              RecomendedMoviesCubit(HomeRepoImpl())..fetchRecomendedMovies(),
        ),
        BlocProvider(
          create: (context) =>
              PopularMoviesCubit(HomeRepoImpl())..fetchPopularMovies(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Routes.baseScreenRoute: (context) => const BaseScreen(),
          Routes.detailsRoute: (context) => const MovieDetailsScreen(),
        },
        theme: AppTheme.lightTheme,
        initialRoute: Routes.baseScreenRoute,
      ),
    );
  }
}
