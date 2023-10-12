import 'package:flutter/material.dart';
import 'package:flutter_starter/src/constants/gaps.dart';
import 'package:flutter_starter/src/constants/paddings.dart';
import 'package:flutter_starter/src/features/exception/models/custom_exception.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter/src/features/my_cars/models/car.dart';

class ExceptionView extends StatelessWidget {
  final CustomException exception;
  final Function? onRetry;
  const ExceptionView(this.exception, {this.onRetry, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.error,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
          ),
          gap16,
          if (exception.errorType != null)
            Text(
              exception.errorType!,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.start,
            ),
          Text(
            exception.message,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onErrorContainer,
                  fontWeight: FontWeight.w100,
                ),
            textAlign: TextAlign.start,
          ),
          gap16,
          if (onRetry != null)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
                backgroundColor: Theme.of(context).colorScheme.errorContainer,
              ),
              onPressed: () => onRetry!(),
              child: Text(AppLocalizations.of(context)!.retry),
            ),
        ],
      ),
    );
  }
}
