import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_routers/calculate/calculate_to_words.dart';
import 'package:go_routers/cubits/theme/theme_cubit.dart';
import 'package:go_routers/home/widget/button.dart';
import 'package:go_routers/utils/app_textstyle.dart';
import 'package:intl/intl.dart';

class OtherPage extends StatelessWidget {
  final String amount;
  const OtherPage({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    String nairaSymbol = '\u20A6';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Other Calculation Page",
          style: AppTextStyles.bodyText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "This is the Other Page after the calculated value in Number which is $nairaSymbol${NumberFormat.decimalPattern('en_US').format(int.parse(amount))} and in words that is ${convertNumberToWords(int.parse(amount))} naira Only",
                style: AppTextStyles.bodySmall,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonPress(
              text: "Click to Change Theme",
              onPressed: () {
                final int randInt = Random().nextInt(10);
                print("RandInt: $randInt");
                context.read<ThemeCubit>().changeTheme(randInt);
              },
            )
          ],
        ),
      ),
    );
  }
}
