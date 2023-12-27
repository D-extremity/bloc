abstract class SignInEvent {}

class SigniInTextChangeEvent extends SignInEvent {
  final String email;
  final String password;
  SigniInTextChangeEvent(this.email, this.password);
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmittedEvent(this.email, this.password);
}
