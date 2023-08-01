import 'package:app/features/user/data/entities/user.dart';
import 'package:app/features/user/ui/pages/user_widget_actions.dart';
import 'package:app/features/user/ui/pages/user_widget_info.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => UserWidgetSmall(user: user),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (context) => UserWidgetSmall(user: user),
        landscape: (context) => UserWidgetMedium(user: user),
      ),
      desktop: (_) => UserWidgetMedium(user: user),
    );
  }
}

class UserWidgetSmall extends StatelessWidget {
  const UserWidgetSmall({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            UserWidgetInfo(user: user),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            UserWidgetActions(),
          ],
        ),
      ),
    );
  }
}

class UserWidgetMedium extends StatelessWidget {
  const UserWidgetMedium({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IntrinsicHeight(
                        child: UserWidgetInfo(user: user),
                      ),
                    ])),
            const Expanded(
              flex: 1, // 60%
              child: Center(
                child: IntrinsicHeight(
                  child: UserWidgetActions(),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
