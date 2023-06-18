import 'dart:convert';
import 'package:dw_front/data/http_headers.dart';
import 'package:dw_front/data/models/new_team_model.dart';
import 'package:dw_front/resources/app_strings.dart';
import 'package:http/http.dart' as http;

class NewTeamContent {
  static Future<http.Response> newTeam(NewTeamModel newTeamModel) async {
    var response = await http.post(Uri.parse("${AppString.url}User/newTeam"),
        body: jsonEncode(newTeamModel.toJson()),
        headers: HttpHeaders.baseHeaders);
    return response;
  }
}