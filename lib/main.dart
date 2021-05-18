import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:untitled/businness_logic/cubit/internet_cubit.dart';
import 'package:untitled/presentation/pages/Home.dart';
import 'package:untitled/presentation/pages/second_screen.dart';
import 'package:untitled/presentation/router/app_routes.dart';
import 'businness_logic/cubit/counter_cubit.dart';

void main() async {
  // HydratedBloc.storage = await HydratedStorage.build();

  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;
  const MyApp({@required this.appRouter, @required this.connectivity});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(create: (context) => InternetCubit(connectivity: widget.connectivity)),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        //AVEC GENERIC NAVIGATION
        onGenerateRoute: widget.appRouter.onGenerateRoute,
        /////AVEC NAMED ROUTE NAVIGATION
        // routes: {
        //   '/': (context) =>
        //       BlocProvider.value(
        //         value:  counterCubit,
        //         child: MyHomePage(title: "Home Page",),
        //       ),
        //   '/second': (context) =>
        //       BlocProvider.value(
        //         value:  counterCubit,
        //         child: SecondPage(title: "SecondScreen"),
        //       ),
        //   '/third': (context) =>
        //       BlocProvider.value(
        //         value:  counterCubit,
        //         child: SecondPage(title: "SecondScreen"),
        //       )
        // },
      ),
    );
  }

  /////ICI IL EST Question DE FERMER LE STREAM ET LE BLOC
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.appRouter.dispose();
  }
}
