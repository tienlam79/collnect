import 'package:flutter/material.dart';

import 'app.dart';
import 'flavor_config.dart';

void main() async {
  FlavorConfig(
    flavor: Flavor.PRODUCTION,
    values: FlavorValues(
      baseUrl: 'https://test-omnyapp.lunexgroup.com',
    ),
    name: 'OMNY Retailer Prod',
  );
  Widget app = await initializeApp();
  runApp(app);
}
