import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/businness_logic/cubit/counter_cubit.dart';

void main(){

    group('CounterCubit',(){
      CounterCubit counterCubit;
      //sert a initialiser
      setUp((){
        counterCubit = CounterCubit();
      });
      //est appeler apres que tous les tests se sont effectuer
      tearDown((){

      });
    });

}