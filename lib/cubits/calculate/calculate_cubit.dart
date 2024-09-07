import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculate_state.dart';

class CalculateCubit extends Cubit<CalculateState> {
  CalculateCubit() : super(CalculateState.initial());

  void convertCurrency(String inputValue) {
    // Ensure that the input is a valid number
    final int parsedValue = int.tryParse(inputValue) ?? 0;

    if (parsedValue < 0) {
      emit(
        state.copyWith(
            currency: 0, errorMessage: "Negative values are not accepted 😒"),
      );

      Future.delayed(const Duration(seconds: 3), () {
        emit(
          state.copyWith(currency: 0, errorMessage: null),
        );
      });
    } else {
      // Performing the conversion
      final int convertedValue = parsedValue * 1500;

      // Emit new state with the converted value
      final newState = state.copyWith(
        currency: convertedValue,
        errorMessage: null,
      );
      print(newState);
      emit(newState);
    }
  }
}
