import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class InitialAuthenticationState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class ProgressIndicationState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class LogInProgressIndicationState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class SignUpProgressIndicationState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class HomeScreenState extends AuthenticationState {
  final String greetings;

  HomeScreenState({@required this.greetings});

  @override
  List<Object> get props => [];
}

class AuthenticationScreenState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class LogInScreenState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class SignUpScreenState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class LogInErrorState extends AuthenticationState {
  final String error;

  LogInErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class SignUpErrorState extends AuthenticationState {
  final String error;

  SignUpErrorState(this.error);

  @override
  List<Object> get props => [error];
}
