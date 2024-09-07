import 'package:flutter/material.dart';
import 'package:go_routers/home/widget/home_widget.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeWidget(
      username: widget.username,
    );
  }
}
