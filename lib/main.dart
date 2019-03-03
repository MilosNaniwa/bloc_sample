import 'package:bloc/bloc.dart';
import 'package:bloc_sample/screen/splash_screen/splash_screen_view.dart';
import 'package:flutter/material.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  onTransition(Transition transition) {
    // blocの挙動をログ出力
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    // エラーをログ出力
    print(error);
  }
}

void main() {
  // blocの挙動を監視
  BlocSupervisor().delegate = SimpleBlocDelegate();
  // アプリを起動
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenView(),
      debugShowCheckedModeBanner: true,
    );
  }
}
