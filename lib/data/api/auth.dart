import 'dart:convert';
import 'package:dw_front/data/http_headers.dart';
import 'package:dw_front/data/models/auth_model.dart';
import 'package:dw_front/data/models/confirm_model.dart';
import 'package:dw_front/data/models/reg_model.dart';
import 'package:dw_front/resources/app_strings.dart';
import 'package:http/http.dart' as http;

class AuthManager {
  static Future<http.Response> reg(RegModel regModel) async {
    var response = await http.post(Uri.parse("${AppString.url}User/reg"),
        body: jsonEncode(regModel.toJson()), headers: HttpHeaders.registerHeaders);
    return response;
  }

  static Future<http.Response> auth(AuthModel authModel) async {
    var response = await http.post(Uri.parse("${AppString.url}User/auth"),
        body:jsonEncode(authModel.toJson()), headers: HttpHeaders.registerHeaders);
    return response;
  }
  static Future<http.Response> conf(ConfirmModel confirmModel) async {
    var response = await http.post(Uri.parse("${AppString.url}User/authconfirm"),
        body:jsonEncode(confirmModel.toJson()), headers: HttpHeaders.registerHeaders);
    return response;
  }
}

