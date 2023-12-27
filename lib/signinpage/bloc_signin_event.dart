abstract class SignInEvent {}

class SigniInTextChange extends SignInEvent {
  final String email;
  final String password;
  SigniInTextChange(this.email, this.password);
}

class SignInSubmitted extends SignInEvent {
  final String email;
  final String password;
  SignInSubmitted(this.email, this.password);
}
