import 'package:dw_front/ui/widgets/strider_divider.dart';
import 'package:dw_front/ui/widgets/number_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_front/cubit/team/cubit.dart';
import 'package:dw_front/ui/widgets/strider_drawer.dart';

class Team extends StatelessWidget {
  const Team({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamCubit, TeamState>(builder: (context, state) {
      var _cubit = context.read<TeamCubit>();
      if (state is TeamEmptyState) {
        _cubit.readyState();
      }
      if (state is TeamLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is TeamReadyState) {
        return Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: const Text("Team_profile"),
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
                                      "Team_name",
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
                              NumberButton(number: "0", text: "проектов"),
                            ],
                          ),
                          const StriderDivider(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
