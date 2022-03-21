import 'package:get_it/get_it.dart';

class GameManager {
  GameManager();

  static void register() {
    GetIt.I.registerLazySingleton(() => GameManager());
  }

  static GameManager get instance => GetIt.I.get<GameManager>();
}
