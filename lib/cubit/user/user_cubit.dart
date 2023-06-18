import 'dart:convert';
import 'package:dw_front/data/api/userpage_content.dart';
import 'package:dw_front/data/models/user_model.dart';
import 'package:dw_front/data/temp_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserEmptyState());

  late UserModel user;

  Future<void> readyState() async {
    Future.delayed(
        const Duration(milliseconds: 100), () => emit(UserLoadingState()));
    await fill();
    Future.delayed(
        const Duration(milliseconds: 100), () => emit(UserReadyState()));
  }

  Future<void> fill() async {
    var response = await UserPageContent.me();
    if (response.statusCode < 300) {
      //user = UserModel.fromJson(jsonDecode(response.body));
    } else {
      Fluttertoast.showToast(msg: "Ты еблан!");
    }
  }
}
