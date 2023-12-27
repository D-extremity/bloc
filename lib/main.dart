import 'package:bloc_learn_two/homepage.dart';
import 'package:bloc_learn_two/signinpage/bloc_signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  
runApp(BlocProvider(create: (_) =>SignInBloc(),
child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomePage(),theme: ThemeData(useMaterial3: true),);
  }
}