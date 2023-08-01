import 'package:app/core/exceptions/app_exceptions.dart';
import 'package:app/core/exceptions/app_exceptions_translator.dart';
import 'package:app/features/main/ui/widgets/custom_snackbar.dart';
import 'package:app/features/user/states/auth_controller.dart';
import 'package:app/features/user/states/settings_controller.dart';
import 'package:app/features/user/states/user_controller.dart';
import 'package:app/l10n/generated/l10n.dart';
import 'package:app/utils/config/app_colors.dart';
import 'package:app/utils/config/app_locales.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UserWidgetActions extends ConsumerWidget {
  const UserWidgetActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);
    final selectedLocale = ref.watch(setLocaleProvider).value;

    var initialLocaleIndex = 0;
    if (selectedLocale == SupportedLocales.english.locale) {
      initialLocaleIndex = 0;
    } else if (selectedLocale == SupportedLocales.french.locale) {
      initialLocaleIndex = 1;
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(Icons.settings),
                ),
                title: Text(
                  L.of(context).settings,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    L.of(context).settings_language,
                  ),
                  ToggleSwitch(
                    initialLabelIndex: initialLocaleIndex,
                    totalSwitches: 2,
                    minWidth: 80,
                    labels: const ["English", "Français"],
                    onToggle: (index) {
                      ref
                          .read(setLocaleProvider.notifier)
                          .setLocale(SupportedLocales.values[index!].locale);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    L.of(context).settings_theme,
                  ),
                  ToggleSwitch(
                    initialLabelIndex: isDark ? 0 : 1,
                    totalSwitches: 2,
                    minWidth: 80,
                    labels: [
                      L.of(context).settings_theme_dark,
                      L.of(context).settings_theme_light
                    ],
                    onToggle: (index) {
                      ref.read(isDarkProvider.notifier).toggleTheme();
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 30),
          Column(
            children: [
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.logout,
                    color: AppColors.danger.color,
                  ),
                ),
                title: Text(
                  L.of(context).profile_actions_logout,
                ),
                onTap: () {
                  ref
                      .read(authControllerProvider.notifier)
                      .logout()
                      .then((value) {
                    CustomSnackbar.display(
                      context,
                      CustomSnackbar(
                        type: CustomSnackbarType.success,
                        title: L.of(context).snackbar_title_success,
                        message: L.of(context).snackbar_message_logout_success,
                      ),
                    );
                  }).onError((error, stackTrace) {
                    final translatedException = AppExceptionsTranslator(
                      context: context,
                      exception: error as AppException,
                    ).translate();
                    CustomSnackbar.display(
                      context,
                      CustomSnackbar(
                        type: CustomSnackbarType.error,
                        title: L.of(context).snackbar_title_error,
                        message: translatedException.message,
                        listStrings:
                            translatedException.errors?.values.toList(),
                      ),
                    );
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.delete,
                    color: AppColors.danger.color,
                  ),
                ),
                title: Text(
                  L.of(context).profile_actions_destroy,
                  style: TextStyle(color: AppColors.danger.color),
                ),
                onTap: () {
                  final alert = AlertDialog(
                    title: Text(L.of(context).alert_title_confirm),
                    content: Text(
                      L.of(context).profile_actions_destroy_confirm_message,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => GoRouter.of(context).pop(),
                        child: Text(
                          L.of(context).button_cancel,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            ref.read(userControllerProvider.notifier).destroy(),
                        child: Text(
                          L.of(context).button_confirm,
                        ),
                      )
                    ],
                  );

                  showDialog<AlertDialog>(
                    context: context,
                    builder: (BuildContext context) => alert,
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
