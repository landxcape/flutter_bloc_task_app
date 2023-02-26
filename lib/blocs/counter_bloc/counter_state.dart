part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counterValue;
  const CounterState({
    required this.counterValue,
  });

  @override
  List<Object> get props => [counterValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counterValue': counterValue,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
    );
  }
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(counterValue: 0);
}

class CounterResetState extends CounterState {
  const CounterResetState({super.counterValue = 0});
}

class CounterIncrementState extends CounterState {
  const CounterIncrementState(int incrementValue) : super(counterValue: incrementValue);
}

class CounterDecrementState extends CounterState {
  const CounterDecrementState(int decrementValue) : super(counterValue: decrementValue);
}
