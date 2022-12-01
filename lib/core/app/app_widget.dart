import 'package:builders/builders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean/core/utils/theme_mode_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:localization/localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:asuka/asuka.dart' as asuka;

import '../../modules/welcome/welcome_routes.dart';
import '../theme/theme_ui.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(WelcomeModule.route);
    Modular.setNavigatorKey;

    LocalJsonLocalization.delegate.directories = ['assets/i18n'];

    return Consumer(
        value: Modular.get<ThemeModeService>(),
        builder: (context, config) {
          return FutureBuilder(
              future: _syncTheme(),
              builder: (context, snapshot) {
                return MaterialApp.router(
                  localizationsDelegates: [
                    // delegate from flutter_localization
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    // delegate from localization package.
                    LocalJsonLocalization.delegate,
                  ],
                  supportedLocales: const [
                    Locale('pt', 'BR'),
                  ],
                  debugShowCheckedModeBanner: false,
                  title: 'Clean App',
                  theme: ThemeUI.theme,
                  darkTheme: ThemeData.dark(),
                  themeMode: Modular.get<ThemeModeService>().getThemeMode(),
                  routeInformationParser: Modular.routeInformationParser,
                  routerDelegate: Modular.routerDelegate,
                );
              });
        });
  }

  Future<void> _syncTheme() async {
    final config = Modular.get<ThemeModeService>();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = prefs.getString('theme') ?? 'system';
    if (ThemeModeService.themeModeToString(config.getThemeMode()) != theme) {
      config.setThemeMode(ThemeModeService.stringToThemeMode(theme));
    }
  }
}
