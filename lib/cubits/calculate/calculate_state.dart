// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';

part of 'calculate_cubit.dart';

class CalculateState extends Equatable {
  final int currency;
  final String? errorMessage;

  const CalculateState({required this.currency, this.errorMessage});

  factory CalculateState.initial() {
    return const CalculateState(currency: 0, errorMessage: null);
  }

  @override
  List<Object?> get props => [currency, errorMessage];

  @override
  bool get stringify => true;

  CalculateState copyWith({
    int? currency,
    String? errorMessage,
  }) {
    return CalculateState(
      currency: currency ?? this.currency,
      errorMessage: errorMessage,
    );
  }
}
