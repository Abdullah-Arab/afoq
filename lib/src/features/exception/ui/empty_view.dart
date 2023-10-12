import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter/src/features/app/ui/app.dart';

import '../../../constants/gaps.dart';
import '../../../constants/paddings.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({required this.onClick, super.key});
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.empty,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          gap8,
          Text(
            AppLocalizations.of(context)!.emptyDescription,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  fontWeight: FontWeight.w100,
                ),
            textAlign: TextAlign.start,
          ),
          gap16,
          FilledButton.icon(
            style: ElevatedButton.styleFrom(
              foregroundColor:
                  Theme.of(context).colorScheme.onSecondaryContainer,
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            ),
            onPressed: () => onClick(),
            label: Text(AppLocalizations.of(context)!.addCar),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
