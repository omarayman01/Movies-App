import 'package:flutter/material.dart';
import 'package:movies_app/view/app_theme.dart';
import 'package:movies_app/view/constants.dart';
import 'package:movies_app/view/features/base.dart';
import 'package:movies_app/view/features/details/views/movie_details.dart';
import 'package:movies_app/view_model/database/network/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.baseScreenRoute: (context) => const BaseScreen(),
        Routes.detailsRoute: (context) => const MovieDetailsScreen(),
      },
      theme: AppTheme.lightTheme,
      initialRoute: Routes.baseScreenRoute,
    );
  }
}
