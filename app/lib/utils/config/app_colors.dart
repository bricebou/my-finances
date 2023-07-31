import 'package:flutter/material.dart';

enum AppColors {
  primary(Colors.pink),
  secondary(Colors.blue),
  danger(Colors.red),
  info(Colors.indigo),
  success(Colors.green),
  warning(Colors.orange);

  const AppColors(this.color);

  final Color color;
}
