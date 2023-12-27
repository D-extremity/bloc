import 'dart:async';

import 'package:bloc_learn_two/signinpage/bloc_signin.dart';
import 'package:bloc_learn_two/signinpage/bloc_signin_event.dart';
import 'package:bloc_learn_two/signinpage/bloc_signin_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _getEmail = TextEditingController();
    TextEditingController _getPassword = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                if (state is SigninInValidState) {
                  return Text(
                    state.error,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              }),
              TextField(
                controller: _getEmail,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SigniInTextChangeEvent(_getEmail.text, _getPassword.text));
                },
                decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _getPassword,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SigniInTextChangeEvent(_getEmail.text, _getPassword.text));
                },
                decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<SignInBloc, SignInState>(builder: (_, state) {
                return CupertinoButton(
                  child: Text("Login"),
                  onPressed: () {
                    if (state is SigninValidState) {
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedEvent(_getEmail.text, _getPassword.text));
                    }
                  },
                  color: (state is SigninInValidState)
                      ? Colors.grey
                      : Colors.green,
                );
              }),
              BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                if (state is SigninLoadingState) {
                  Timer.periodic(Duration(seconds: 15), (timer) {
                    CircularProgressIndicator();
                  });
                  return Text("Loaded");
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
