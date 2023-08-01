import 'package:app/utils/config/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  const CustomSnackbar(
      {required this.type,
      required this.title,
      this.message,
      this.listStrings});

  final CustomSnackbarType type;
  final String title;
  final String? message;
  final List? listStrings;

  static void display(BuildContext context, CustomSnackbar customSnackbar) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(customSnackbar._build(context));
  }

  SnackBar _build(BuildContext context) {
    return SnackBar(
        backgroundColor: type.backgroundColor,
        content: Row(
          children: [
            Icon(
              type.icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                if (message != null)
                  Text(
                    message!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize,
                    ),
                  ),
                if (listStrings != null)
                  for (var element in listStrings!) Text(element.toString()),
                const SizedBox(
                  height: 6,
                )
              ],
            ),
          ],
        ));
  }
}

class CustomSnackbarType {
  const CustomSnackbarType(
      {required this.type, this.icon, this.backgroundColor});

  final String type;
  final IconData? icon;
  final Color? backgroundColor;

  static CustomSnackbarType info = CustomSnackbarType(
      type: 'info', icon: Icons.info, backgroundColor: AppColors.info.color);
  static CustomSnackbarType error = CustomSnackbarType(
      type: 'error',
      icon: Icons.error,
      backgroundColor: AppColors.danger.color);
  static CustomSnackbarType success = CustomSnackbarType(
      type: 'success',
      icon: Icons.check,
      backgroundColor: AppColors.success.color);
  static CustomSnackbarType warning = CustomSnackbarType(
      type: 'warning',
      icon: Icons.warning,
      backgroundColor: AppColors.warning.color);
}
