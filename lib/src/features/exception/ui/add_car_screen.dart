import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter/src/constants/gaps.dart';

import 'package:flutter_starter/src/constants/paddings.dart';
import 'package:flutter_starter/src/constants/themes.dart';
import 'package:flutter_starter/src/features/my_cars/models/car_document.dart';
import 'package:flutter_starter/src/services/logger/logger.dart';
import 'package:flutter_starter/src/services/service_locator/locator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:uid/uid.dart';

import '../../my_cars/logic/cubit/my_cars_cubit.dart';
import '../../my_cars/models/car.dart';

@RoutePage()
class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  Color _currentColor = Colors.white;
  final _formKey = GlobalKey<FormState>();
  final _colorController = TextEditingController();
  final _nameController = TextEditingController();
  final _modelController = TextEditingController();
  final _plateNumberController = TextEditingController();
  List<CarDocument> _documents = [];
  final _documentFormKey = GlobalKey<FormState>();
  final _documentTitleController = TextEditingController();
  final _documentDescriptionController = TextEditingController();
  final _documentIssueDateController = TextEditingController();
  final _documentExpiryDateController = TextEditingController();

  @override
  void dispose() {
    _colorController.dispose();
    _nameController.dispose();
    _modelController.dispose();
    _plateNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addCar),
      ),
      body: Center(
        child: Padding(
            padding: padding16,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: defaultInputBorder,
                        labelText: AppLocalizations.of(context)!.carName,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText:
                                AppLocalizations.of(context)!.carNameRequired),
                      ]),
                    ),
                    gap16,
                    TextFormField(
                      controller: _modelController,
                      decoration: InputDecoration(
                        border: defaultInputBorder,
                        labelText: AppLocalizations.of(context)!.carModel,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText:
                                AppLocalizations.of(context)!.carModelRequired),
                      ]),
                    ),
                    gap16,
                    TextFormField(
                      controller: _plateNumberController,
                      decoration: InputDecoration(
                        border: defaultInputBorder,
                        labelText: AppLocalizations.of(context)!.carPlateNumber,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: AppLocalizations.of(context)!
                                .carPlateNumberRequired),
                      ]),
                    ),
                    gap16,
                    TextFormField(
                      controller: _colorController,
                      onTap: () {
                        _showColorPicker();
                      },
                      decoration: InputDecoration(
                        border: defaultInputBorder,
                        labelText: AppLocalizations.of(context)!.carColor,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.color_lens),
                          onPressed: _showColorPicker,
                        ),
                        prefixIcon: Container(
                          width: 16,
                          height: 16,
                          margin: padding8,
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
                    ),
                    gap16,
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        side: BorderSide(
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                      child: Padding(
                        padding: padding16,
                        child: Form(
                          key: _documentFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.carDocuments,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              gap16,
                              TextFormField(
                                controller: _documentTitleController,
                                decoration: InputDecoration(
                                  border: defaultInputBorder,
                                  labelText: AppLocalizations.of(context)!
                                      .carDocumentTitle,
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: AppLocalizations.of(context)!
                                          .carDocumentTitleRequired),
                                ]),
                              ),
                              gap16,
                              TextFormField(
                                controller: _documentDescriptionController,
                                decoration: InputDecoration(
                                  border: defaultInputBorder,
                                  labelText: AppLocalizations.of(context)!
                                      .carDocumentDescription,
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: AppLocalizations.of(context)!
                                          .carDocumentDescriptionRequired),
                                ]),
                              ),
                              gap16,
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: _documentIssueDateController,
                                      decoration: InputDecoration(
                                        border: defaultInputBorder,
                                        labelText: AppLocalizations.of(context)!
                                            .carDocumentIssueDate,
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(
                                            errorText: AppLocalizations.of(
                                                    context)!
                                                .carDocumentIssueDateRequired),
                                      ]),
                                      onTap: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1950),
                                            //DateTime.now() - not to allow to choose before today.
                                            lastDate: DateTime(2100));

                                        if (pickedDate != null) {
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);
                                          setState(() {
                                            _documentIssueDateController.text =
                                                formattedDate; //set output date to TextField value.
                                          });
                                        } else {}
                                      },
                                    ),
                                  ),
                                  gap16,
                                  Expanded(
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: _documentExpiryDateController,
                                      decoration: InputDecoration(
                                        border: defaultInputBorder,
                                        labelText: AppLocalizations.of(context)!
                                            .carDocumentExpiryDate,
                                      ),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              errorText: AppLocalizations.of(
                                                      context)!
                                                  .carDocumentExpiryDateRequired),
                                        ],
                                      ),
                                      onTap: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1950),
                                            //DateTime.now() - not to allow to choose before today.
                                            lastDate: DateTime(2100));

                                        if (pickedDate != null) {
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);
                                          setState(() {
                                            _documentExpiryDateController.text =
                                                formattedDate; //set output date to TextField value.
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              gap16,
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: () {
                                    if (_documentFormKey.currentState!
                                        .validate()) {
                                      final document = CarDocument(
                                        id: DateTime.now()
                                            .microsecondsSinceEpoch
                                            .toString(),
                                        title: _documentTitleController.text,
                                        description:
                                            _documentDescriptionController.text,
                                        issueDate: DateTime.parse(
                                            _documentIssueDateController.text),
                                        expiryDate: DateTime.parse(
                                            _documentExpiryDateController.text),
                                      );
                                      setState(() {
                                        _documents.add(document);
                                      });
                                      // clear form
                                      _documentTitleController.clear();
                                      _documentDescriptionController.clear();
                                      _documentIssueDateController.clear();
                                      _documentExpiryDateController.clear();
                                    }
                                  },
                                  child:
                                      Text(AppLocalizations.of(context)!.save),
                                ),
                              ),
                              gap16,
                              const Divider(),
                              gap16,
                              ListView.builder(
                                //scrollDirection: Axis.horizontal,

                                shrinkWrap: true,
                                itemCount: _documents.length,
                                itemBuilder: (context, index) {
                                  final document = _documents[index];
                                  return ListTile(
                                    title: Text(document.title),
                                    subtitle: Text(document.description),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          _documents.removeAt(index);
                                        });
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    gap16,
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (_documents.isEmpty) {
                              // show toast
                              Fluttertoast.showToast(
                                msg: AppLocalizations.of(context)!
                                    .carDocumentsRequired,
                                toastLength: Toast.LENGTH_LONG,
                              );

                              locator<Log>().info('No documents');

                              return;
                            }
                            final car = Car(
                              id: DateTime.now()
                                  .microsecondsSinceEpoch
                                  .toString(),
                              name: _nameController.text,
                              model: _modelController.text,
                              color: _colorController.text,
                              plateNumber: _plateNumberController.text,
                              createdAt: DateTime.now(),
                              documents: _documents,
                            );
                            locator<Log>().info('Car $car');
                            locator<MyCarsCubit>().addCar(car);
                            AutoRouter.of(context).pop();
                          }
                        },
                        child: Text(AppLocalizations.of(context)!.save),
                      ),
                    ),
                  ],
                ),
              ),
            )),
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
                  _colorController.text =
                      _currentColor.value.toRadixString(16).toUpperCase();
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
