import 'package:flutter/material.dart';
import 'package:go_routers/calculate/widgets/calculate_widget.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  @override
  Widget build(BuildContext context) {
    return const CurrencyConverter();
  }
}
