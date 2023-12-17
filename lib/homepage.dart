import 'package:bloc_learn/blocs/connectivity/internet_bloc.dart';
// import 'package:bloc_learn/blocs/connectivity/internet_event.dart';
import 'package:bloc_learn/blocs/connectivity/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<InternetBloc, InternetBlocState>(
          builder: (context, state) {
            if (state is InternetBlocGainedState) {
              return const Text("Connected");
            } else if (state is InternetBlocLostState) {
              return const Text("Not Connected");
            } else {
              return const Text("Loading...");
            }
          },
        ),
      ),
    );
  }
}
