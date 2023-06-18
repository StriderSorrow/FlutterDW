import 'package:dw_front/cubit/project_add/project_add_cubit.dart';
import 'package:dw_front/ui/widgets/rich_text_field.dart';
import 'package:dw_front/ui/widgets/strider_button.dart';
import 'package:dw_front/ui/widgets/strider_drawer.dart';
import 'package:dw_front/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectAddReadyScreen extends StatelessWidget {
  const ProjectAddReadyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<ProjectAddCubit>();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Добавление нового проекта"),
      ),
      drawer: const StriderDrawer(),
      body: Center(
        child: Column(
          children: [
            ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 350,
                      height: 50,
                      child: CustomTextField(
                        textController: _cubit.title,
                        hint: 'Название проекта:',
                        obscure: false,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomRichTextField(
                        textController: _cubit.description, hint: "Описание:"),
                    // SingleChildScrollView(
                    //   child: Container(
                    //     padding: const EdgeInsets.all(16.0),
                    //     child: const TextField(
                    //       maxLines: null,
                    //       decoration: InputDecoration(
                    //         hintText: 'Введите текст',
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      height: 50,
                      child: StriderButton(text: "Создать коллектив", func: _cubit.saver),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
