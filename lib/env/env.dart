// ignore_for_file: public_member_api_docs

import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'HOST')
  static const String HOST = _Env.HOST;
}
