// // import 'package:bloc_learn/blocs/connectivity/internet_bloc.dart';
// // import 'package:bloc_learn/blocs/connectivity/internet_event.dart';
// // import 'package:bloc_learn/blocs/connectivity/internet_state.dart';
// import 'package:bloc_learn/cubits/connectivity_cubit.dart';
// import 'package:bloc_learn/cubits/connectivity_state_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeCubitPage extends StatelessWidget {
//   const HomeCubitPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: BlocBuilder<CubitConnection, CubitConnectionState>(
//           builder: (context, state) {
//             if (state is CubitInternetGainedState) {
//               return const Text("Connected");
//             } else if (state is CubitInternetLostState) {
//               return const Text("Not Connected");
//             } else {
//               return const Text("Loading...");
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

//!  is used to check if two objects belong to same class or not
//!  == used to check if two values are equal or not (enum is value)


// import 'package:bloc_learn/blocs/connectivity/internet_bloc.dart';
// import 'package:bloc_learn/blocs/connectivity/internet_event.dart';
// import 'package:bloc_learn/blocs/connectivity/internet_state.dart';
import 'package:bloc_learn/cubits/connectivity_cubit.dart';
import 'package:bloc_learn/cubits/connectivity_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubitPage extends StatelessWidget {
  const HomeCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CubitConnection, CubitConnectionState>(
          builder: (context, state) {
            if (state == CubitConnectionState.CubitInternetGainedState) {
              return const Text("Connected");
            } else if (state == CubitConnectionState.CubitInternetLostState) {
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
