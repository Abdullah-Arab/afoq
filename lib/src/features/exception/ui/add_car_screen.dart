import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter/src/constants/gaps.dart';
import 'package:flutter_starter/src/constants/paddings.dart';
import 'package:flutter_starter/src/constants/themes.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uid/uid.dart';

import '../../my_cars/models/car.dart';
import '../../my_cars/models/car_document.dart';

@RoutePage()
class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  Color _currentColor = Colors.white;
  final List<FormBuilderTextField> fields = [];

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
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              FormBuilderTextField(
                name: 'name',
                decoration: InputDecoration(
                  border: defaultInputBorder,
                  labelText: AppLocalizations.of(context)!.carName,
                  hintText: AppLocalizations.of(context)!.carNameHint,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: AppLocalizations.of(context)!.carNameRequired),
                ]),
              ),
              gap16,
              FormBuilderTextField(
                name: 'model',
                decoration: InputDecoration(
                  border: defaultInputBorder,
                  labelText: AppLocalizations.of(context)!.carModel,
                  hintText: AppLocalizations.of(context)!.carModelHint,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText:
                          AppLocalizations.of(context)!.carModelRequired),
                ]),
              ),
              gap16,
              FormBuilderTextField(
                name: 'color',
                onTap: () {
                  _showColorPicker();
                },
                decoration: InputDecoration(
                  border: defaultInputBorder,
                  labelText:
                      _currentColor.value.toRadixString(16).toUpperCase(),
                  //AppLocalizations.of(context)!.carColor
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.color_lens),
                    onPressed: _showColorPicker,
                  ),
                  prefixIcon: Container(
                    width: 16,
                    height: 16,
                    margin: paddingH8,
                    decoration: BoxDecoration(
                      color: _currentColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText:
                          AppLocalizations.of(context)!.carColorRequired),
                ]),
                onChanged: (value) {
                  setState(() {
                    _currentColor = Color(int.parse(value!));
                  });
                },
                valueTransformer: (value) => value?.toString(),
              ),
              gap16,
              FormBuilderTextField(
                name: 'plateNumber',
                decoration: InputDecoration(
                  border: defaultInputBorder,
                  labelText: AppLocalizations.of(context)!.carPlateNumber,
                  hintText: AppLocalizations.of(context)!.carPlateNumberHint,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText:
                          AppLocalizations.of(context)!.carPlateNumberRequired),
                ]),
              ),
              gap16,
              Expanded(
                child: ListView.builder(
                  itemCount: fields.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FormBuilder(
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'documentTitle',
                            decoration: InputDecoration(
                              border: defaultInputBorder,
                              labelText: AppLocalizations.of(context)!
                                  .carDocumentTitle,
                              hintText: AppLocalizations.of(context)!
                                  .carDocumentTitleHint,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: AppLocalizations.of(context)!
                                      .carDocumentTitleRequired),
                            ]),
                          ),
                          gap16,
                          FormBuilderTextField(
                            name: 'documentDescription',
                            decoration: InputDecoration(
                              border: defaultInputBorder,
                              labelText: AppLocalizations.of(context)!
                                  .carDocumentDescription,
                              hintText: AppLocalizations.of(context)!
                                  .carDocumentDescriptionHint,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: AppLocalizations.of(context)!
                                      .carDocumentDescriptionRequired),
                            ]),
                          ),
                          gap16,
                          FormBuilderDateTimePicker(
                            name: 'documentIssueDate',
                            decoration: InputDecoration(
                              border: defaultInputBorder,
                              labelText: AppLocalizations.of(context)!
                                  .carDocumentIssueDate,
                              hintText: AppLocalizations.of(context)!
                                  .carDocumentIssueDateHint,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: AppLocalizations.of(context)!
                                      .carDocumentIssueDateRequired),
                            ]),
                          ),
                          gap16,
                          FormBuilderDateTimePicker(
                            name: 'documentExpiryDate',
                            decoration: InputDecoration(
                              border: defaultInputBorder,
                              labelText: AppLocalizations.of(context)!
                                  .carDocumentExpiryDate,
                              hintText: AppLocalizations.of(context)!
                                  .carDocumentExpiryDateHint,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: AppLocalizations.of(context)!
                                      .carDocumentExpiryDateRequired),
                            ]),
                          ),
                          gap16,
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    setState(() {
                      fields.add(
                        FormBuilderTextField(
                          name: 'documentTitle',
                          decoration: InputDecoration(
                            border: defaultInputBorder,
                            labelText:
                                AppLocalizations.of(context)!.carDocumentTitle,
                            hintText: AppLocalizations.of(context)!
                                .carDocumentTitleHint,
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: AppLocalizations.of(context)!
                                    .carDocumentTitleRequired),
                          ]),
                        ),
                      );
                    });
                  },
                  child: Text(AppLocalizations.of(context)!.carDocumentsHint),
                ),
              ),
              gap16,
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      final formData = _formKey.currentState!.value;
                      final documents = fields
                          .map((form) => (form as FormBuilder))
                          .map((data) => CarDocument(
                                id: UId.getId(),
                                title: 'tst',
                                description: 'tst',
                                issueDate: DateTime.now(),
                                expiryDate: DateTime.now(),
                              ))
                          .toList();
                      final car = Car(
                        id: formData['id'],
                        name: formData['name'],
                        model: formData['model'],
                        color: _currentColor.toString(),
                        plateNumber: formData['plateNumber'],
                        createdAt: formData['createdAt'],
                        documents: documents,
                      );
                      // TODO: Save the car to the database
                    }
                  },
                  child: Text(AppLocalizations.of(context)!.save),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.pickCarColor),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _currentColor,
              onColorChanged: (color) {
                setState(() {
                  _currentColor = color;
                });
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.of(context)!.ok),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
