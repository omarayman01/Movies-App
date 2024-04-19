import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';
import 'package:movies_app/view_model/database/firebase/firebase_utils.dart';

class MoviesProvider with ChangeNotifier {
  List<MovieModel> movies = [];

  Future<void> getTasks() async {
    final allTasks = await FireBaseUtils.getAllmoviesFromFireStore();
    movies = allTasks;

    notifyListeners();
  }
}
