import 'package:app/core/exceptions/app_exceptions.dart';
import 'package:app/core/exceptions/app_exceptions_translator.dart';
import 'package:app/features/main/ui/widgets/custom_snackbar.dart';
import 'package:app/features/user/data/entities/user.dart';
import 'package:app/features/user/states/user_controller.dart';
import 'package:app/l10n/generated/l10n.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class UserWidgetInfo extends ConsumerStatefulWidget {
  const UserWidgetInfo({super.key, required this.user});

  final User user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserWidgetInfoState();
}

class _UserWidgetInfoState extends ConsumerState<UserWidgetInfo> {
  final _picker = ImagePicker();

  Future<void> _openImagePicker() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final formData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(pickedImage.path),
      });
      await ref
          .watch(userControllerProvider.notifier)
          .uploadAvatar(data: formData)
          .onError((error, stackTrace) {
        final translatedException = AppExceptionsTranslator(
          context: context,
          exception: error! as AppException,
        ).translate();
        if (context.mounted) {
          CustomSnackbar.display(
            context,
            CustomSnackbar(
              type: CustomSnackbarType.error,
              title: L.of(context).snackbar_title_error,
              message: translatedException.message,
              listStrings: translatedException.errors!.values.toList(),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          /// -- IMAGE
          Stack(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: widget.user.avatarUrl == ''
                      ? Image.asset(
                          'assets/images/steve-johnson-WVUrbhWtRNM-unsplash.jpg',
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          widget.user.avatarUrl!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                height: 30,
                width: 30,
                child: ElevatedButton(
                  onPressed: _openImagePicker,
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 20,
                  ),
                ),
              )
            ],
          ),

          /// -- TITLE
          Text(
            widget.user.name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            widget.user.email,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),

          /// -- BUTTON
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () => _showModalBottomSheet(context),
              child: Text(L.of(context).button_edit),
            ),
          ),
        ],
      ),
    );
  }

  static void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return _BottomSheetContent();
      },
    );
  }
}

class _BottomSheetContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 320,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Center(
              child: Text(
                L.of(context).form_title_profile_edit,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          const Divider(thickness: 1),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: 380,
                child: ProfileForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileForm extends ConsumerStatefulWidget {
  const ProfileForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileFormState();
}

class _ProfileFormState extends ConsumerState<ProfileForm> {
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  final TextEditingController usernameEditingController =
      TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final validatorUsername = ValidationBuilder().required().minLength(3).build();
  final validatorEmail = ValidationBuilder().required().email().build();

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userControllerProvider).value;

    usernameEditingController.text = user?.name ?? '';
    emailEditingController.text = user?.email ?? '';

    return Form(
      key: profileFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: usernameEditingController,
            decoration: InputDecoration(
              labelText: L.of(context).form_label_username,
              // labelStyle: const TextStyle(color: Colors.black54),
            ),
            // style: const TextStyle(color: Colors.black),
            validator: validatorUsername,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: emailEditingController,
            decoration: InputDecoration(
              labelText: L.of(context).form_label_email,
              // labelStyle: const TextStyle(color: Colors.black54),
            ),
            // style: const TextStyle(color: Colors.black),
            validator: validatorEmail,
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: () {
              if (profileFormKey.currentState!.validate()) {
                ref
                    .read(userControllerProvider.notifier)
                    .updateUser(
                      name: usernameEditingController.text,
                      email: emailEditingController.text,
                    )
                    .then((value) {
                  GoRouter.of(context).pop();
                }).onError((error, stackTrace) {
                  final translatedException = AppExceptionsTranslator(
                          context: context, exception: error as AppException)
                      .translate();
                  CustomSnackbar.display(
                    context,
                    CustomSnackbar(
                        type: CustomSnackbarType.error,
                        title: L.of(context).snackbar_title_error,
                        message: translatedException.message,
                        listStrings:
                            translatedException.errors?.values.toList()),
                  );
                });
              }
            },
            style: const ButtonStyle(
              maximumSize: MaterialStatePropertyAll(Size(200, 52)),
              foregroundColor: MaterialStatePropertyAll(Colors.white),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.save),
                const SizedBox(
                  width: 6,
                ),
                Text(L.of(context).form_button_submit.toLowerCase()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
