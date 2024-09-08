// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'dart:convert';

part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;

  const CounterState({required this.counter});

  factory CounterState.initial() {
    return const CounterState(counter: 0);
  }

  @override
  List<Object> get props => [counter];

  @override
  bool get stringify => true;

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'counter': counter,
    };
  }

  factory CounterState.fromJson(Map<String, dynamic> json) {
    return CounterState(
      counter: json['counter'] as int,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory CounterState.fromJson(String source) => CounterState.fromMap(json.decode(source) as Map<String, dynamic>);
}
