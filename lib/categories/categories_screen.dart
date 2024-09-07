import 'package:flutter/material.dart';
import 'package:go_routers/categories/widgets/categories_widget.dart';

class CategoriesScreen extends StatefulWidget {
  final String amount;
  const CategoriesScreen({super.key, required this.amount});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return CategoriesWidget(amount: widget.amount);
  }
}
