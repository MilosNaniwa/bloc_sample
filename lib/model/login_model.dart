import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginModel extends Equatable {
  final String userId;
  final String password;

  LoginModel({
    @required this.userId,
    @required this.password,
  }) : super([
          userId,
          password,
        ]);
}
