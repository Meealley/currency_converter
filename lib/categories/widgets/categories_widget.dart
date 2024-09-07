import 'package:flutter/material.dart';
import 'package:go_routers/calculate/calculate_to_words.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  "Welcome to the Category Screen",
                  style: AppTextStyles.bodyText,
                ),
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              '\$${NumberFormat.decimalPattern('en_US').format(int.parse(amount))} and in words that is ${convertNumberToWords(int.parse(amount))}',
              style: AppTextStyles.bodyTextBold,
            )
          ],
        ),
      ),
    );
  }
}
