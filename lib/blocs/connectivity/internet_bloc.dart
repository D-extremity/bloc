//! Dont forget to add Block Provider at main.dart or wherever(all the below widgets can access it then) you want to use it
//! and also BlocBuilder widget to use that bloc.
import 'dart:async';
import 'package:bloc_learn/blocs/connectivity/internet_event.dart';
import 'package:bloc_learn/blocs/connectivity/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetBlocEvent, InternetBlocState> {
  StreamSubscription? connectionSubscription;
  final Connectivity _connectivity = Connectivity();
//& InternetBloc():super(); is the constructor but super needs state which is need to be the initial {what state you want to show earliest on loading done.}
//& hence , we gave  "InternetBlocInitialState()" , and removed semicolon coz we need to give state (show state continuously as stream)
//& ***connectivity.onConnectivityChanged.listen((connection)){}***
//! connectivity is package and .onConnectivityChanged.listen is function inside that package only
//! add(eventName());  means on this particular condition add this event ,
//! which has been done here add(InternetBlocGainedEvent)
//* on<eventName>(event,emit)=>emit(stateName);
//* this means when "XYZ" event name is added then on<XYZ> event , particular state is emmitted

  InternetBloc() : super(InternetBlocInitialState()) {
    connectionSubscription =
        _connectivity.onConnectivityChanged.listen((connection) {
      if (connection == ConnectivityResult.mobile ||
          connection == ConnectivityResult.wifi) {
        add(InternetBlocGainedEvent());
      } else {
        add(InternetBlocLostEvent());
      }
    });

    on<InternetBlocLostEvent>(
      (event, emit) => emit(InternetBlocLostState()),
    );

    on<InternetBlocGainedEvent>(
      (event, emit) => emit(InternetBlocGainedState()),
    );
  }
//! .listen is type of StreamSubscription hence it will work continuouslly even after that state is closed ,
//! hence we need to close it explicitly so that after state is closed it will also stop its subscription.

  @override
  Future<void> close() {
    connectionSubscription?.cancel();
    return super.close();
  }
}
