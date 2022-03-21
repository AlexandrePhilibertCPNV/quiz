import 'package:get_it/get_it.dart';

class ScoreManager {
  int _score = 0;

  int get score => _score;

  void add(int value) {
    _score += value;
  }

  static void register() {
    GetIt.I.registerLazySingleton(() => ScoreManager());
  }

  static ScoreManager get instance => GetIt.I.get<ScoreManager>();
}
