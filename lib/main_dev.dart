import 'package:flutter/material.dart';
import 'app.dart';
import 'flavor_config.dart';

void main() async {
  FlavorConfig(
    flavor: Flavor.DEV,
    values: FlavorValues(
      baseUrl: 'https://test-omnyapp.lunexgroup.com',
    ),
    name: 'OMNY Retailer Dev',
  );
  Widget app = await initializeApp();
  runApp(app);
}
