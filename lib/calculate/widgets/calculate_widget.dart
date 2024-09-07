import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_routers/cubits/calculate/calculate_cubit.dart';
import 'package:go_routers/home/widget/button.dart';
import 'package:go_routers/utils/app_textstyle.dart';

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return BlocListener<CalculateCubit, CalculateState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.currency > 10000) {
          context.pushNamed("/other",
              pathParameters: {'converted': '${state.currency}'});
        }
      },
      child: BlocBuilder<CalculateCubit, CalculateState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Convert Currency",
                style: AppTextStyles.bodyText,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Currency convert here",
                    style: AppTextStyles.bodyText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${state.currency}',
                    style: AppTextStyles.headingBold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      style: AppTextStyles.bodyText,
                      decoration: InputDecoration(
                        hintText: "Please enter any amount",
                        hintStyle: AppTextStyles.bodySmall,
                        contentPadding: const EdgeInsets.only(
                          top: 1,
                          bottom: 0,
                          left: 6,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (state.errorMessage != null)
                    Text(
                      state.errorMessage!,
                      style: AppTextStyles.errorTextMessage,
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonPress(
                    text: "Click to calculate",
                    onPressed: () {
                      context
                          .read<CalculateCubit>()
                          .convertCurrency(controller.text);
                      print(controller.text);
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
