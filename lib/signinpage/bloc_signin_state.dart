abstract class SignInState {}

class SigninInitialState extends SignInState {}

class SigninInValidState extends SignInState {
  final String error;
  SigninInValidState(this.error);
}

class SigninValidState extends SignInState {}

class SigninLoadingState extends SignInState {}
