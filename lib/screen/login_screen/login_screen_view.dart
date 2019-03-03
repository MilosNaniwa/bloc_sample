import 'package:bloc_sample/data_provider/firebase/firebase.dart';
import 'package:bloc_sample/repository/authentication/authentication.dart';
import 'package:bloc_sample/screen/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class LoginScreenView extends StatefulWidget {
  @override
  _LoginScreenViewState createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  static LoginScreenBloc _loginScreenBloc;
  static AuthenticationRepository _authenticationRepository;
  static FirebaseDataProvider _firebaseDataProvider;

  @override
  void initState() {
    super.initState();
    _firebaseDataProvider = FirebaseDataProvider();
    _authenticationRepository = AuthenticationRepository(
      firebaseDataProvider: _firebaseDataProvider,
    );
    _loginScreenBloc = LoginScreenBloc(
      authenticationRepository: _authenticationRepository,
    );
  }

  @override
  void dispose() {
    _loginScreenBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginScreenPage(
      loginScreenBloc: _loginScreenBloc,
    );
  }
}
