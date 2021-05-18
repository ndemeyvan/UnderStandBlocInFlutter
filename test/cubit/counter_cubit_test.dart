import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/businness_logic/cubit/counter_cubit.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit;
    //sert a initialiser les variable lors d'un test
    setUp(() {
      counterCubit = CounterCubit();
    });
    //est appeler apres que tous les tests se sont effectuer
    tearDown(() {
      counterCubit.close();
    });

    test("la valeur initial de counterCubit est CounterState(counter:0) ", () {
      // ici je compare la valeur que j'attend a la valeur aue j'ai
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest(
        "cubit doit me retourner un counterState(counterValue:1) et wasIncremented:true ",
        build: () {
      return counterCubit;
    }, act: (cubit) {
      counterCubit.increment(1);
    }, expect: [CounterState(counterValue: 1,wasIncremented: true)]);

    blocTest(
        "cubit doit me retourner un counterState(counterValue:0) et wasIncremented:false ",
        build: () {
          return counterCubit;
        }, act: (cubit) {
      counterCubit.decrement();
    }, expect: [CounterState(counterValue: -1,wasIncremented: false)]);
  });
}
