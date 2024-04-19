import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/model/movie_model/movie_model.dart';

class FireBaseUtils {
  static CollectionReference<MovieModel> getmoviesCollection() =>
      FirebaseFirestore.instance.collection('Movz').withConverter<MovieModel>(
            fromFirestore: (snapshot, options) =>
                MovieModel.fromJson(snapshot.data()!),
            toFirestore: (movieModel, options) => movieModel.toJson(),
          );

  static Future<void> addmovieToFireStore(MovieModel movie) {
    final moviesCollection = getmoviesCollection();
    final doc = moviesCollection.doc();
    movie.idd = doc.id;
    return doc.set(movie);
  }

  static Future<List<MovieModel>> getAllmoviesFromFireStore() async {
    final moviesCollection = getmoviesCollection();
    final snapshot = await moviesCollection.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  static Future<void> deletemovieFromFireStore(MovieModel movie) {
    final moviesCollection = getmoviesCollection();
    return moviesCollection.doc(movie.idd).delete();
  }
}
