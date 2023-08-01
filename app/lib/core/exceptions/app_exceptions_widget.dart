import 'package:app/core/exceptions/app_exceptions.dart';
import 'package:app/core/exceptions/app_exceptions_translator.dart';
import 'package:app/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppExceptionWidget extends StatefulWidget {
  const AppExceptionWidget({super.key, required this.appException});

  final AppException appException;

  @override
  State<AppExceptionWidget> createState() => _AppExceptionWidgetState();
}

class _AppExceptionWidgetState extends State<AppExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final translatedAppException = AppExceptionsTranslator(
            context: context, exception: widget.appException)
        .translate();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (translatedAppException.statusCode != null)
          Column(children: [
            Center(
              child: Text(
                '${L.of(context).error} ${translatedAppException.statusCode.toString()}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ]),
        Center(
            child: Text(
          translatedAppException.message!,
          style: Theme.of(context).textTheme.titleLarge,
        )),
        if (translatedAppException.errors != null)
          Column(
            children: [
              for (var element
                  in translatedAppException.errors!.values.toList())
                Text(element.toString()),
            ],
          ),
      ],
    );
  }
}
