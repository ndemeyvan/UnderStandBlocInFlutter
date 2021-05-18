part of 'counter_cubit.dart';

class CounterState extends Equatable {

  int counterValue;
  bool wasIncremented;

   @override
  // TODO: implement props
  List<Object> get props => [this.counterValue, this.wasIncremented];

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  CounterState({
    @required this.counterValue,
    @required this.wasIncremented,
  });

  CounterState copyWith({
    int counterValue,
    bool wasIncremented,
  }) {
    return new CounterState(
      counterValue: counterValue ?? this.counterValue,
      wasIncremented: wasIncremented ?? this.wasIncremented,
    );
  }

  @override
  String toString() {
    return 'CounterState{counterValue: $counterValue, wasIncremented: $wasIncremented}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CounterState &&
          runtimeType == other.runtimeType &&
          counterValue == other.counterValue &&
          wasIncremented == other.wasIncremented);

  @override
  int get hashCode => counterValue.hashCode ^ wasIncremented.hashCode;

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return new CounterState(
      counterValue: map['counterValue'] as int,
      wasIncremented: map['wasIncremented'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'counterValue': this.counterValue,
      'wasIncremented': this.wasIncremented,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
