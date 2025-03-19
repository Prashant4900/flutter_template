import 'package:flutter_template/utils/app_logger.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlUtility {
  static Future<void> contactUs() async {
    try {
      String? encodeQueryParameters(Map<String, String> params) {
        return params.entries
            .map((MapEntry<String, String> e) {
              return '''${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}''';
            })
            .join('&');
      }

      final emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'prashantnigam490@gmail.com',
        query: encodeQueryParameters(<String, String>{
          'subject': 'Example Subject & Symbols are allowed!',
        }),
      );

      await launchUrl(emailLaunchUri);
    } catch (exception, stackTrace) {
      AppLogger.error(exception.toString(), stackTrace);
    }
  }

  static Future<void> launch(String url) async {
    try {
      final uri = Uri.parse(url);

      await launchUrl(uri);
    } catch (exception, stackTrace) {
      AppLogger.error(exception.toString(), stackTrace);
    }
  }
}
