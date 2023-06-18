import 'package:dw_front/data/http_headers.dart';
import 'package:dw_front/resources/app_strings.dart';
import 'package:http/http.dart' as http;

class UserPageContent {
  static Future<http.Response> me() async {
    var response = await http.get(Uri.parse("${AppString.url}User/me"),
        headers: HttpHeaders.baseHeaders);
    return response;
  }
}
