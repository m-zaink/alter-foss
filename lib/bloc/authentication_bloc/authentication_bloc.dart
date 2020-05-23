import 'dart:async';
import 'package:alterfoss/repositories/auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import '../bloc.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => InitialAuthenticationState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event.runtimeType == CheckForLoggedInStatusEvent) {
      yield ProgressIndicationState();
      bool isUserLoggedIn = await AuthRepository().isLoggedIn;
      if (isUserLoggedIn) {
        yield HomeScreenState(greetings: 'Welcome Back!');
      } else {
        yield AuthenticationScreenState();
      }
    }

    if (event.runtimeType == ClickedOnLogInButtonEvent) {
      yield LogInScreenState();
    }

    if (event.runtimeType == ClickedOnSignUpButtonEvent) {
      yield SignUpScreenState();
    }

    if (event.runtimeType == SignUpEvent) {
      yield SignUpProgressIndicationState();
      String email = (event as SignUpEvent).email;
      String password = (event as SignUpEvent).password;
      String username = (event as SignUpEvent).username;

      bool authenticationSuccessful = await AuthRepository().signUp(
        username: username,
        email: email,
        password: password,
      );

      if (authenticationSuccessful) {
        yield HomeScreenState(
            greetings: 'Hey $username. Welcome to AlterFOSS family!');
      } else {
        yield SignUpErrorState('User doesn\'t exist');
      }
    }

    if (event.runtimeType == LogInEvent) {
      yield LogInProgressIndicationState();
      String email = (event as LogInEvent).email;
      String password = (event as LogInEvent).password;

      bool authenticationSuccessful =
          await AuthRepository().logIn(email: email, password: password);

      if (authenticationSuccessful) {
        yield HomeScreenState(greetings: 'Welcome back!');
      } else {
        yield LogInErrorState('Invalid email or password');
      }
    }

    if (event.runtimeType == LogOutEvent) {
      AuthRepository().logout();
      yield AuthenticationScreenState();
    }

    if (event.runtimeType == OpenAuthenticationScreenEvent) {
      yield AuthenticationScreenState();
    }
  }
}
