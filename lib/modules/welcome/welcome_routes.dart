import 'package:flutter_modular/flutter_modular.dart';

import 'pages/welcome_page.dart';
import 'presenters/welcome_presenter.dart';

class WelcomeModule extends Module {
  static const route = '/';

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => WelcomePresenter()),
  ];
  @override
  List<Module> get imports => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const WelcomePage()),
  ];
}
