import 'package:flutter_modular/flutter_modular.dart';
import 'package:youapp/pages/splash_screen.dart';
import 'package:youapp/routes/youapp_routes.dart';

class YouAppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          YouAppRoutes.root,
          child: (context, args) => const SplashScreen(),
        ),
      ];
}
