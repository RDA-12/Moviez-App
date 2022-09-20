import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: ".env")
abstract class Env {
  @EnviedField(varName: "imdbAPIKey", obfuscate: true)
  static final imdbAPIKey = _Env.imdbAPIKey;
  @EnviedField(varName: "newsAPIKey", obfuscate: true)
  static final newsAPIKey = _Env.newsAPIKey;
}
