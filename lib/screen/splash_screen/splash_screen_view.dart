import 'package:bloc_sample/screen/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  static SplashScreenBloc _splashScreenBloc;

  @override
  void initState() {
    super.initState();
    _splashScreenBloc = SplashScreenBloc();
  }

  @override
  void dispose() {
    _splashScreenBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenPage(
      splashScreenBloc: _splashScreenBloc,
    );
  }
}
