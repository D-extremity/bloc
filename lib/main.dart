// import 'package:bloc_learn/blocs/connectivity/internet_bloc.dart';
import 'package:bloc_learn/cubits/connectivity_cubit.dart';
import 'package:bloc_learn/homecubit.dart';
// import 'package:bloc_learn/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitConnection(),
      // create: (context) => InternetBloc(),
      child: const MaterialApp(
        home: HomeCubitPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
