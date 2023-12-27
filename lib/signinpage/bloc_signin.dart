import 'package:bloc_learn_two/signinpage/bloc_signin_event.dart';
import 'package:bloc_learn_two/signinpage/bloc_signin_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SigninInitialState()) {
    on<SigniInTextChangeEvent>(
      (event, emit) {
        if (event.email == "" ||
            EmailValidator.validate(event.email) == false) {
          emit(SigninInValidState("Invalid Email"));
        } else if (event.password==""||event.password.length < 8) {
          emit(SigninInValidState("Password should be atleast of length 8"));
        } else {
          emit(SigninValidState());
        }
      },
    );
    on<SignInSubmittedEvent>(
      (event, emit) {
        emit(SigninLoadingState());
      },
    );
  }
}
