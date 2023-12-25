// import 'dart:async';

// import 'package:bloc_learn/cubits/connectivity_state_cubit.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//! Cubit only needs state as stream not event
// class CubitConnection extends Cubit<CubitConnectionState> {
//   late StreamSubscription connectionSubscription;
//   Connectivity _connectivity = Connectivity();
//   CubitConnection() : super(CubitInternetIntialState()) {
//     connectionSubscription =
//         _connectivity.onConnectivityChanged.listen((result) {
//       if (result == ConnectivityResult.mobile ||
//           result == ConnectivityResult.wifi) {
//         emit(CubitInternetGainedState());
//       } else {
//         emit(CubitInternetLostState());
//       }
//     });
//   }
//   @override
//   Future<void> close() {
//     connectionSubscription.cancel();
//     return super.close();
//   }
// }



import 'dart:async';

import 'package:bloc_learn/cubits/connectivity_state_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//! Cubit only needs state not even t, as state is only stream 

class CubitConnection extends Cubit<CubitConnectionState> {
  late StreamSubscription connectionSubscription;
  Connectivity _connectivity = Connectivity();
  CubitConnection() : super(CubitConnectionState.CubitInternetInitialState) {
    connectionSubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(CubitConnectionState.CubitInternetGainedState);
      } else {
        emit(CubitConnectionState.CubitInternetInitialState);
      }
    });
  }
  @override
  Future<void> close() {
    connectionSubscription.cancel();
    return super.close();
  }
}
