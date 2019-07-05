import 'package:bloc_sample/screen/login/login_screen_page.dart';
import 'package:bloc_sample/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  static SplashScreenBloc _bloc;

  static String _message;

  @override
  void initState() {
    super.initState();
    _message = "";
    _bloc = SplashScreenBloc();
    _bloc.dispatch(
      OnRequestInitializingEvent(),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _bloc,
      listener: (context, state) async {
        if (state is InitializingState) {
          _message = "Initializing";
        } else if (state is InitializedState) {
          _message = "Initialized";

          _bloc.dispatch(
            OnRequestNavigatingToLoginScreenEvent(),
          );
        } else if (state is ToLoginScreenNavigatingState) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => LoginScreenPage(),
            ),
            (context) => false,
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _message,
                style: TextStyle(fontSize: 50.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
