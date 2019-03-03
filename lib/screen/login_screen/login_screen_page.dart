import 'package:bloc_sample/model/login/login.dart';
import 'package:bloc_sample/screen/login_screen/login_screen.dart';
import 'package:bloc_sample/screen/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenPage extends StatefulWidget {
  final LoginScreenBloc loginScreenBloc;

  LoginScreenPage({
    @required this.loginScreenBloc,
  });

  @override
  _LoginScreenPageState createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  LoginScreenBloc get _splashScreenBloc => widget.loginScreenBloc;

  @override
  void initState() {
    super.initState();
    _splashScreenBloc.dispatch(
      LoginScreenStartedEvent(),
    );
  }

  @override
  void dispose() {
    _splashScreenBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isAuthenticationFail = false;

    return Scaffold(
      body: BlocBuilder(
        bloc: _splashScreenBloc,
        builder: (BuildContext context, LoginScreenState state) {
          // 認証中の状態になった場合
          if (state is LoginScreenAuthenticatingState) {
            // ローディング画面を表示する
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(AUTHENTICATING),
                  SizedBox(
                    height: 20.0,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
          // 次画面へ遷移中の状態になった場合
          if (state is LoginScreenToFirstScreenNavigatingState) {
            SchedulerBinding.instance.addPostFrameCallback(
              (_) async {
                // 次画面へ遷移する
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => Navigation(),
                  ),
                  (context) => false,
                );
              },
            );
            // 次画面への遷移完了を通知する
            _splashScreenBloc.dispatch(
              LoginScreenToFirstScreenNavigationCompletedEvent(),
            );
          }
          // 認証に失敗した場合
          if (state is LoginScreenAuthenticationFailedState) {
            isAuthenticationFail = true;
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                RaisedButton(
                  key: Key(LOGIN_BUTTON),
                  child: Text(LOGIN),
                  onPressed: _onPressedLoginButton,
                ),
                RaisedButton(
                  key: Key(LOGIN_BUTTON_FAIL),
                  child: Text(LOGIN_FAIL),
                  onPressed: _onPressedLoginFailButton,
                ),
                isAuthenticationFail ? Text('ログイン失敗') : Container(),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onPressedLoginButton() {
    // ログイン情報を作成する
    LoginModel _loginModel = LoginModel(
      userId: 'hoge',
      password: 'fuga',
    );

    // ログインボタンがタップされたことを通知する
    _splashScreenBloc.dispatch(
      LoginScreenLoginButtonOnPressedEvent(
        loginModel: _loginModel,
      ),
    );
  }

  void _onPressedLoginFailButton() {
    // ログイン情報を作成する
    LoginModel _loginModel = LoginModel(
      userId: 'hoge',
      password: 'fufu',
    );

    // ログインボタンがタップされたことを通知する
    _splashScreenBloc.dispatch(
      LoginScreenLoginButtonOnPressedEvent(
        loginModel: _loginModel,
      ),
    );
  }
}
