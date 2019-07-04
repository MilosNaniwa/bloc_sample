import 'package:bloc_sample/data_provider/firebase_data_provider.dart';
import 'package:bloc_sample/model/login_model.dart';
import 'package:bloc_sample/repository/authentication_repository.dart';
import 'package:bloc_sample/screen/login/login_screen.dart';
import 'package:bloc_sample/screen/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenPage extends StatefulWidget {
  @override
  _LoginScreenPageState createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  static LoginScreenBloc _bloc;
  static AuthenticationRepository _authenticationRepository;
  static FirebaseDataProvider _firebaseDataProvider;

  static bool isAuthenticationFailed;

  @override
  void initState() {
    super.initState();
    isAuthenticationFailed = false;

    _firebaseDataProvider = FirebaseDataProvider();

    _authenticationRepository = AuthenticationRepository(
      firebaseDataProvider: _firebaseDataProvider,
    );

    _bloc = LoginScreenBloc(
      authenticationRepository: _authenticationRepository,
    );

    _bloc.dispatch(
      OnRequestInitializing(),
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
      listener: (context, state) {
        if (state is Initialized) {
          _bloc.dispatch(
            OnCompleteRendering(),
          );
        } else if (state is Authenticating) {
          showDialog(
              context: context,
              builder: (context) => Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Loading"),
                          CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  ));
        } else if (state is AuthenticationSucceeded) {
          _bloc.dispatch(
            OnRequestNavigatingToContentScreen(),
          );
        } else if (state is AuthenticationFailed) {
          isAuthenticationFailed = true;
          Navigator.of(context).pop();
          _bloc.dispatch(
            OnCompleteRendering(),
          );
        } else if (state is ToContentScreenNavigating) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => Navigation(),
            ),
            (context) => false,
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              RaisedButton(
                child: Text("Login"),
                onPressed: () => _bloc.dispatch(
                      OnRequestAuthenticating(
                        loginModel: LoginModel(
                          userId: 'hoge',
                          password: 'fuga',
                        ),
                      ),
                    ),
              ),
              isAuthenticationFailed ? Text('login failed') : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
