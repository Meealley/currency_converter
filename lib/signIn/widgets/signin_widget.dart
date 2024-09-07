import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_routers/cubits/authentication/authentication_cubit.dart';
import 'package:go_routers/home/widget/button.dart';
import 'package:go_routers/utils/app_textstyle.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SignIn",
          style: AppTextStyles.heading,
        ),
      ),
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          // TODO: implement listener
          // if (state.authModel.username.isNotEmpty) {
          //   context.goNamed(
          //     "/home",
          //     extra: state.authModel.username,
          //   );
          // }

          if (state.authModel.username.isNotEmpty) {
            // Show circular progress indicator for 5 seconds before navigating
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(
                child: Text(
                  "Loading...",
                  style: AppTextStyles.bodySmall,
                ),
              ),
            );

            // Wait for 5 seconds, then navigate to home
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop(); // Close the progress indicator
              // context.pop();
              context.goNamed("/home", extra: state.authModel.username);
            });
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Sign In ",
                  style: AppTextStyles.heading,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter your name",
                  style: AppTextStyles.bodySmall,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: TextField(
                    // onChanged: (value) {
                    //   context
                    //       .read<AuthenticationCubit>()
                    //       .usernameChanged(value);
                    // },
                    controller: _usernameController,
                    style: AppTextStyles.bodyText,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        top: 1,
                        bottom: 0,
                        left: 6,
                      ),
                      errorText: state.usernameError,
                      errorStyle: AppTextStyles.errorTextMessage,
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
                Text(
                  "Enter your Password",
                  style: AppTextStyles.bodySmall,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: TextField(
                    // onChanged: (value) {
                    //   context
                    //       .read<AuthenticationCubit>()
                    //       .passwordChanged(value);
                    // },
                    controller: _passwordController,
                    style: AppTextStyles.bodyText,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        top: 1,
                        bottom: 0,
                        left: 6,
                      ),
                      errorText: state.passwordError,
                      errorStyle: AppTextStyles.errorTextMessage,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonPress(
                  text: "Click to Sign Up",
                  onPressed: () {
                    final String username = _usernameController.text;
                    final String password = _passwordController.text;

                    context
                        .read<AuthenticationCubit>()
                        .authenticate(username, password);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
