import 'package:flutter/material.dart';
import 'package:flutter_clean/core/utils/theme_mode_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final config = Modular.get<ThemeModeService>();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home'),
            TextButton(
                onPressed: () => config.setThemeMode(ThemeMode.dark),
                child: const Text('dark')),
            TextButton(
                onPressed: () => config.setThemeMode(ThemeMode.light),
                child: const Text('light')),
            TextButton(
                onPressed: () => config.setThemeMode(ThemeMode.system),
                child: const Text('system'))
          ],
        ),
      )),
    );
  }
}
