import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presentation/pages/Home.dart';
import 'package:untitled/presentation/pages/second_screen.dart';
import 'package:untitled/presentation/router/app_routes.dart';

import 'businness_logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
AppRouter appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      //AVEC GENERIC NAVIGATION
      onGenerateRoute: appRouter.onGenerateRoute,
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
    );
  }
}

