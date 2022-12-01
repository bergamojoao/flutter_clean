import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import '../presenters/welcome_presenter.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = Modular.get<WelcomePresenter>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.welcomeDuration(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
          body: Center(
        child: Text('Splash Screen'),
      )),
    );
  }
}
