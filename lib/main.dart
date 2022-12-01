import 'package:builders/builders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/app/app_module.dart';
import 'core/app/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Builders
  Builders.systemInjector(Modular.get);
  // Execute App
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
