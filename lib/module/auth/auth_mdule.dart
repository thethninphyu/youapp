import 'package:flutter_modular/flutter_modular.dart';
import 'package:youapp/auth/register/register.dart';
import 'package:youapp/routes/auth/auth_routes.dart';

class AuthModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(AuthRoutes.login,
            child: (context, args) => const RegisterWidget()),
      ];
}
