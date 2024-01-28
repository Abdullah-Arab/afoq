import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/src/constants/gaps.dart';
import 'package:flutter_starter/src/constants/paddings.dart';
import 'package:flutter_starter/src/constants/themes.dart';
import 'package:flutter_starter/src/utilities/methods.dart';

import 'package:flutter_starter/src/features/app/ui/app.dart';
import 'package:flutter_starter/src/features/my_cars/models/car.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

@RoutePage()
class CarDetailScreen extends StatelessWidget {
  final Car car;
  const CarDetailScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.carDetails,
        ),
      ),
      body: Padding(
        padding: padding16,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // display the clolor of the car from string car.color
              ListTile(
                title: Text(
                  car.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(
                  car.model,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: CircleAvatar(
                  backgroundColor: stringToColor(car.color),
                ),
              ),

              const Divider(),
              // for displaying car document
              Text(
                AppLocalizations.of(context)!.documents,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              car.documents.isEmpty
                  ? Text(AppLocalizations.of(context)!.empty)
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: car.documents.length,
                        itemBuilder: (context, index) {
                          final document = car.documents[index];
                          return ListTile(
                            title: Text(document.title),
                            subtitle: Text(document.description),
                            trailing: Container(
                              // height: 5,
                              // width: 80,
                              padding: paddingH8V4,
                              decoration: BoxDecoration(
                                color: document.expiryDate
                                        .isBefore(DateTime.now())
                                    ? Colors.red.shade200
                                    : document.expiryDate.isBefore(
                                            DateTime.now()
                                                .add(const Duration(days: 30)))
                                        ? Colors.yellow.shade200
                                        : Colors.green.shade200,
                                // shape: BoxShape.circle,
                              ),
                              child: Text(
                                DateFormat.yMd().format(document.expiryDate),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.white,
                                      shadows: [
                                        const Shadow(
                                          color: Colors.black38,
                                          blurRadius: 3,
                                          offset: Offset(1, 1),
                                        ),
                                      ],
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
