import 'package:bloc_sample/screen/login_screen/login_screen_view.dart';
import 'package:bloc_sample/screen/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenPage extends StatefulWidget {
  final SplashScreenBloc splashScreenBloc;

  SplashScreenPage({
    @required this.splashScreenBloc,
  });

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  SplashScreenBloc get _splashScreenBloc => widget.splashScreenBloc;

  @override
  void initState() {
    super.initState();
    _splashScreenBloc.dispatch(
      SplashScreenStartedEvent(),
    );
  }

  @override
  void dispose() {
    _splashScreenBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: _splashScreenBloc,
        builder: (BuildContext context, SplashScreenState state) {
          // 次画面へ遷移中の状態になった場合
          if (state is SplashScreenToLoginScreenNavigatingState) {
            SchedulerBinding.instance.addPostFrameCallback(
              (_) async {
                // ローディング画面表示のために3秒待機
                await Future.delayed(const Duration(seconds: 3));

                // 次画面へ遷移
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => LoginScreenView(),
                  ),
                  (context) => false,
                );
              },
            );
            // 次画面への遷移完了を通知
            _splashScreenBloc.dispatch(
              SplashScreenToLoginScreenNavigationCompletedEvent(),
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  TITLE,
                  style: TextStyle(fontSize: 50.0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
