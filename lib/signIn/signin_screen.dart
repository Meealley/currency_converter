import 'package:flutter/material.dart';
import 'package:go_routers/signIn/widgets/signin_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return const SignInWidget();
  }
}
