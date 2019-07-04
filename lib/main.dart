import 'package:bloc/bloc.dart';
import 'package:bloc_sample/screen/splash/splash_screen_page.dart';
import 'package:bloc_sample/simple_bloc_delegate.dart';
import 'package:flutter/material.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenPage(),
      debugShowCheckedModeBanner: true,
    );
  }
}
