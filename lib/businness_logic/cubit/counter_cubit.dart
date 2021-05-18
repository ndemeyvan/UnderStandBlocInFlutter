import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/constant/enums.dart';
import 'internet_cubit.dart';
part 'counter_state.dart';

//with HydratedMixin
class CounterCubit extends Cubit<CounterState> {



  ///METHOD SANS STREAMSOUSCRIBER
  // il suffit de mettre un bloc prodiver et de lecouter
  //dans notre cas counter ecoute internetBloc , donc
  // il faut juste attendre que conter repond poour demander a CounterCubit de reagir en fait
  CounterCubit(): super(CounterState(counterValue: 0));

  void increment(int value) => emit(CounterState(
      counterValue: state.counterValue + value, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  // @override
  // CounterState fromJson(Map<String, dynamic> json) {
  //   return CounterState.fromMap(json);
  // }
  //
  // @override
  // Map<String, dynamic> toJson(CounterState state) {
  //   return state.toMap();
  // }




  ///METHOD AVEC STREAMSOUSCRIBER
// StreamSubscription internetStreamSubscription;

// StreamSubscription<InternetState> monitorInternetConnexion() {
  //   //   return    internetStreamSubscription =  internetCubit.listen((internetState) {
  //   //     if(internetState is InternetConnected && internetState.connectionType == ConnectionType.wifi  ){
  //   //       increment(10);
  //   //     }else if (internetState is InternetConnected && internetState.connectionType == ConnectionType.Mobile){
  //   //       decrement();
  //   //     }else {
  //   //       //nothing to do
  //   //     }
  //   // });
  // }



  // @override
  // Future<void> close() {
  //   internetStreamSubscription.cancel();
  //   return super.close();
  // }

//Le probleme avec le stream soucriber est que si il ya deja beaucoup de dependance entre les bloc et que leur nombre augmente cela deviens difficille a maintenir

}
