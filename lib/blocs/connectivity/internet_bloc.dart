import 'dart:async';

import 'package:bloc_learn/blocs/connectivity/internet_event.dart';
import 'package:bloc_learn/blocs/connectivity/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetBlocEvent, InternetBlocState> {
  StreamSubscription? connectionSubscription;
  final Connectivity _connectivity = Connectivity();
  InternetBloc() : super(InternetBlocInitialState()) {
    on<InternetBlocLostEvent>(
      (event, emit) => emit(InternetBlocLostState()),
    );

    on<InternetBlocGainedEvent>(
      (event, emit) => emit(InternetBlocGainedState()),
    );

    connectionSubscription =
        _connectivity.onConnectivityChanged.listen((connection) {
      if (connection == ConnectivityResult.mobile ||
          connection == ConnectivityResult.wifi) {
        add(InternetBlocGainedEvent());
      } else {
        add(InternetBlocLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectionSubscription?.cancel();
    return super.close();
  }
}
