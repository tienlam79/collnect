import 'package:flutter/material.dart';
import 'app.dart';
import 'flavor_config.dart';

void main() async {
  FlavorConfig(
    flavor: Flavor.DEV,
    values: FlavorValues(
      baseUrl: 'https://test-omnyapp.lunexgroup.com',
      sku: 1000,
    ),
    name: 'Collnect Dev',
  );
  Widget app = await initializeApp();
  runApp(app);
}
