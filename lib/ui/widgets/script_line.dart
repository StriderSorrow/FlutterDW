import 'package:dw_front/cubit/scenario/scenario_cubit.dart';
import 'package:dw_front/ui/widgets/rich_text_field.dart';
import 'package:dw_front/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScriptLine extends StatelessWidget {
  const ScriptLine({super.key});


  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<ScenarioCubit>();
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              const Text(
                "Редактирование строки",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  textController: _cubit.start,
                  obscure: false,
                  hint: "Начало"),
          const SizedBox(
            height: 20,),
              CustomTextField(
                  textController: _cubit.end,
                  obscure: false,
                  hint: "Конец"),
              const SizedBox(
                height: 20,),
              CustomTextField(
                  textController: _cubit.character,
                  obscure: false,
                  hint: "Персонаж"),
              const SizedBox(
                height: 20,),
              CustomRichTextField(
                  textController: _cubit.originalText,
                  hint: "Текст оригинала"),
              const SizedBox(
                height: 20,),
              CustomRichTextField(
                  textController: _cubit.translatedText,
                  hint: "Текст перевода"),
            ],
          ),
        ),
      );
    });
  }
}
