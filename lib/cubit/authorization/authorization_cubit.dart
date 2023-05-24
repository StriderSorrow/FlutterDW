import 'package:dw_front/data/api/auth.dart';
import 'package:dw_front/data/models/auth_model.dart';
import 'package:dw_front/data/models/confirm_model.dart';
import 'package:dw_front/data/temp_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  AuthorizationCubit() : super(AuthorizationEmptyState());

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  String? code;
  final TextEditingController emailCode = TextEditingController();

  Future<void> readyState() async {
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(AuthorizationLoadingState()));
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(AuthorizationReadyState()));
  }

  Future<void>authorizer()async{
    var auth = AuthModel(email: email.text, password: password.text);
    var response = await AuthManager.auth(auth);
    if (response.statusCode<300) {
      code = response.body;
      emit(AuthorizationAuthorizedState());
    }
    else
    {
      Fluttertoast.showToast(msg: "Данный Email или логин уже занят!");
    }
  }

  Future<void>confirm()async{
    var confirm = ConfirmModel(code: code!, emailCode: emailCode.text);
    var response = await AuthManager.conf(confirm);
    if (response.statusCode<300) {
      TempData.token = response.body;
      emit(AuthorizationConfirmState());
    }
    else
    {
      Fluttertoast.showToast(msg: "Введён неверный код!");
    }
  }
}
