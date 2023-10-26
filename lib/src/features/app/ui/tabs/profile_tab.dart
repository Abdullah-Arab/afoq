import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../services/service_locator/locator.dart';
import '../../../auth/logic/auth_cubit.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
          onPressed: () {
            locator<AuthCubit>().logout();
          },
          child: Text(AppLocalizations.of(context)!.logout)),
    );
  }
}
