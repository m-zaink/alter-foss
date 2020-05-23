import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class OpenAuthenticationScreenEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class ClickedOnLogInButtonEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class ClickedOnSignUpButtonEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class LogInEvent extends AuthenticationEvent {
  final String email;
  final String password;

  LogInEvent({this.email, this.password});

  @override
  List<Object> get props => [email, password];
}

class LogOutEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthenticationEvent {
  final String username;
  final String email;
  final String password;

  SignUpEvent({this.username, this.email, this.password});

  @override
  List<Object> get props => [username, email, password];
}

class CheckForLoggedInStatusEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
