import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter/src/constants/paddings.dart';
import 'package:uid/uid.dart';
import '../../my_cars/models/car.dart';
import '../../my_cars/models/car_document.dart';

@RoutePage()
class AddCarScreen extends StatelessWidget {
  const AddCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addCar),
      ),
      body: Center(
        child: Padding(
          padding: padding16,
          child: FormBuilder(
            key: _formKey,
            child: FormBuilderTextField(
              name: 'text',
              onChanged: (val) {
                print(val); // Print the text value write into TextField
              },
            ),
          ),
        ),
      ),
    );
  }
}
