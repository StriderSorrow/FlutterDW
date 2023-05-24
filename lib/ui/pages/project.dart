import 'package:dw_front/ui/widgets/number_button.dart';
import 'package:dw_front/ui/widgets/strider_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_front/cubit/project/cubit.dart';
import 'package:dw_front/ui/widgets/strider_drawer.dart';

class Project extends StatelessWidget {
  const Project({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectState>(builder: (context, state) {
      var _cubit = context.read<ProjectCubit>();
      if (state is ProjectEmptyState) {
        _cubit.readyState();
      }
      if (state is ProjectLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ProjectReadyState) {
        return Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: const Text("Project_profile"),
          ),
          drawer: const StriderDrawer(),
          body: Column(
            children: [
              ColoredBox(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  right: 20,
                                ),
                                child: CircleAvatar(radius: 50),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Project_name",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.brush))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            child: Column(
                              children: const [
                                Icon(Icons.crop_din, size: 40),
                                Text("Подать заявку"),
                              ],
                            ),
                          ),
                          GestureDetector(
                            child: Column(
                              children: const [
                                Icon(Icons.notifications_none, size: 40),
                                Text("Уведомления"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ColoredBox(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Text(
                                'Описание:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Text(
                              '"описание"',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        const StriderDivider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            NumberButton(number: "0", text: "участников"),
                            NumberButton(number: "0", text: "персонажей"),
                            NumberButton(
                                number: "0", text: "персонажей занято"),
                            NumberButton(number: "0", text: "аудиодорожек"),
                          ],
                        ),
                        const StriderDivider(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: const Text("Cценарий проекта"),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
