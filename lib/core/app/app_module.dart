import 'package:flutter_clean/core/utils/theme_mode_service.dart';
import 'package:flutter_clean/modules/home/home_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../modules/welcome/welcome_routes.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => ThemeModeService()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(WelcomeModule.route, module: WelcomeModule()),
        ModuleRoute(HomeModule.route, module: HomeModule()),
      ];
}
