import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_routers/calculate/calculate_to_words.dart';
import 'package:go_routers/cubits/color/color_cubit.dart';
import 'package:go_routers/cubits/counter/counter_cubit.dart';
import 'package:go_routers/home/widget/button.dart';
import 'package:go_routers/utils/app_colors.dart';
import 'package:go_routers/utils/app_textstyle.dart';
import 'package:intl/intl.dart';

class CategoriesWidget extends StatelessWidget {
  final String amount;
  const CategoriesWidget({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories",
          style: AppTextStyles.heading,
        ),
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.watch<ColorCubit>().state.color,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Welcome to the Counter Screen",
                          style: AppTextStyles.bodyText,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "${state.counter}",
                          style: AppTextStyles.headingBold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          convertNumberToWords(state.counter),
                          style: AppTextStyles.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  '\$${NumberFormat.decimalPattern('en_US').format(int.parse(amount))} and in words that is ${convertNumberToWords(int.parse(amount))}',
                  style: AppTextStyles.bodyTextBold,
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonPress(
                  text: "Change Container Color",
                  onPressed: () {
                    context.read<ColorCubit>().changeColor();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonPress(
                  text: "Change Counter Value",
                  onPressed: () {
                    context.read<CounterCubit>().changeCounter();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
