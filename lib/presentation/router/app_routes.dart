import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/businness_logic/cubit/counter_cubit.dart';
import 'package:untitled/presentation/pages/Home.dart';
import 'package:untitled/presentation/pages/second_screen.dart';
import 'package:untitled/presentation/pages/thirdScreen.dart';

class AppRouter {
  // CounterCubit counterCubit = CounterCubit();

  // Route onGenerateRoute(RouteSettings routeSettings) {
  //   switch (routeSettings.name) {
  //     case "/":
  //       return MaterialPageRoute(builder: (_) =>
  //           BlocProvider.value(
  //             value: counterCubit,
  //             child: MyHomePage(title: "Home Page"),
  //           ));
  //       break;
  //     case "/second":
  //       return MaterialPageRoute(
  //           builder: (_) =>
  //               BlocProvider.value(
  //                 value: counterCubit,
  //                 child: SecondPage(title: "Second Page"),
  //               ));
  //       break;
  //     case "/third":
  //       return MaterialPageRoute(builder: (_) =>
  //           BlocProvider.value(
  //             value:  counterCubit,
  //             child: ThirdPage(),
  //           ));
  //       break;
  //     default:
  //       null;
  //   }
  // }

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) =>
            MyHomePage(title: "Home Page"));
        break;
      case "/second":
        return MaterialPageRoute(
            builder: (_) =>
                SecondPage(title: "Second Page"));
        break;
      case "/third":
        return MaterialPageRoute(builder: (_) =>
            ThirdPage());
        break;
      default:
        null;
    }
  }

  void dispose (){
  }

}