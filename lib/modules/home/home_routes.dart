import 'package:flutter_clean/modules/home/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  static const route = '/home/';

  @override
  final List<Bind> binds = [];
  @override
  List<Module> get imports => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
