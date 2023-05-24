import 'package:dw_front/data/api/auth.dart';
import 'package:dw_front/data/models/confirm_model.dart';
import 'package:dw_front/data/models/reg_model.dart';
import 'package:dw_front/data/temp_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationEmptyState());

  final TextEditingController email = TextEditingController();
  final TextEditingController login = TextEditingController();
  final TextEditingController password = TextEditingController();
  String? code;
  final TextEditingController emailCode = TextEditingController();

  Future<void> readyState() async {
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(RegistrationLoadingState()));
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(RegistrationReadyState()));
  }
  Future<void>register()async{
    var reg = RegModel(email: email.text, username: login.text, password: password.text);
    var response = await AuthManager.reg(reg);
    if (response.statusCode<300) {
      code = response.body;
      emit(RegistrationConfirmState());
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
      emit(RegistrationAuthorizedState());
    }
    else
    {
      Fluttertoast.showToast(msg: "Введён неверный код!");
    }
  }
}
