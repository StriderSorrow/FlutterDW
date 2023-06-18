import 'dart:convert';
import 'package:dw_front/cubit/team/cubit.dart';
import 'package:dw_front/data/api/new_team_content.dart';
import 'package:dw_front/data/models/new_team_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'team_add_state.dart';

class TeamAddCubit extends Cubit<TeamAddState> {
  TeamAddCubit() : super(TeamAddEmptyState());

  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  Future<void> readyState() async {
    Future.delayed(
        const Duration(milliseconds: 100), () => emit(TeamAddLoadingState()));
    //await fill();
    Future.delayed(
        const Duration(milliseconds: 100), () => emit(TeamAddReadyState()));
  }

  Future<void>saver()async{
    var newTeam = NewTeamModel(title: title.text, description: description.text);
    var response = await NewTeamContent.newTeam(newTeam);
    if (response.statusCode<300) {
      emit(TeamAddedState());
    }
    else
    {
      Fluttertoast.showToast(msg: "Ошибка!");
    }
  }
}
