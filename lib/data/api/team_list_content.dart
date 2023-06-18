import 'dart:convert';
import 'package:dw_front/data/http_headers.dart';
import 'package:dw_front/resources/app_strings.dart';
import 'package:http/http.dart' as http;

class TeamListContent {
  static Future<http.Response> teamlist() async {
    var response = await http.get(Uri.parse("${AppString.url}User/teamlist"),
        headers: HttpHeaders.baseHeaders);
    return response;
  }
}
