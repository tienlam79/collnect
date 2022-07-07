import 'package:flutter/material.dart';
import 'app.dart';
import 'flavor_config.dart';

void main() async {
  FlavorConfig(
    flavor: Flavor.QA,
    values: FlavorValues(
      baseUrl: 'https://test-omnyapp.lunexgroup.com',
    ),
    name: 'OMNY Retailer QA',
  );
  Widget app = await initializeApp();
  runApp(app);
}
