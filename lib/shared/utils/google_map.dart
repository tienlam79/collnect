import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    Uri uri = Uri(
      scheme: 'https',
      host: 'www.google.com',
      path: '/maps/search/?api=1&query=$latitude,$longitude',
    );
    try {
      final canLaunch = await canLaunchUrl(uri);
      if (canLaunch) {
        await launchUrl(uri);
      }
    } catch (error) {
      Future.error('error');
    }
  }
}
