import 'package:flutter/material.dart';
import 'package:flutter_clean/modules/home/home_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomePresenter extends ChangeNotifier implements Disposable {
  welcomeDuration(BuildContext context) {
    nextPage() async {
      Modular.to.pushNamedAndRemoveUntil(HomeModule.route, (_) => true);
    }

    var delayWelcome = Future.delayed(const Duration(seconds: 2), () {});

    Future.wait([delayWelcome]).then((value) async {
      await nextPage();
    });
  }
}
