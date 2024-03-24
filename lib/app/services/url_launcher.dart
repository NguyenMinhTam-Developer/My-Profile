import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static Future<void> launchHttps({required String url}) async {
    final Uri uri = Uri.parse(url);

    if (!await canLaunchUrl(uri)) {
      throw Exception('Could not launch $url');
    }

    launchUrl(uri, mode: LaunchMode.externalApplication);

    return;
  }
}
