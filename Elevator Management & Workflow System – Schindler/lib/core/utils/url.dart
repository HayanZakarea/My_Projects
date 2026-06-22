
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UrlHelper {

  static void tryLaunch(String url)async{
    launchUrl(Uri.parse(url));
  }

}