import 'package:dw_front/cubit/user/cubit.dart';
import 'package:dw_front/cubit/navigation/cubit.dart';
import 'package:dw_front/ui/widgets/number_button.dart';
import 'package:dw_front/ui/widgets/strider_divider.dart';
import 'package:dw_front/ui/widgets/strider_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserReadyScreen extends StatelessWidget {
  const UserReadyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<UserCubit>();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("${_cubit.user.nickname}"),
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
                              padding: EdgeInsets.only(right: 20),
                              child: CircleAvatar(radius: 50),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${_cubit.user.nickname}",
                                  style: const TextStyle(
                                    fontSize: 20,
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ColoredBox(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.house),
                                    Text(
                                        "Город: ${_cubit.user.town ?? "не указан"}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.alarm),
                                    Text(
                                        "Часовой пояс: ${_cubit.user.timeZone ?? "не указан"}"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const StriderDivider(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              NumberButton(
                                  number: _cubit.user.activeTasksCount ?? 0,
                                  text: "активных задач",
                                  func: () {}),
                              const VerticalDivider(),
                              NumberButton(
                                number: _cubit.user.teamsCount ?? 0,
                                text: "коллективов",
                                func: () {
                                  context
                                      .read<NavigationCubit>()
                                      .pushToTeamListScene();
                                },
                              ),
                              const VerticalDivider(),
                              NumberButton(
                                number: _cubit.user.projectsCount ?? 0,
                                text: "проектов",
                                func: () {},
                              ),
                              const VerticalDivider(),
                              NumberButton(
                                number: _cubit.user.audiosCount ?? 0,
                                text: "аудиодорожек",
                                func: () {},
                              ),
                              const VerticalDivider(),
                              NumberButton(
                                number: _cubit.user.videosCount ?? 0,
                                text: "видеозаписей",
                                func: () {},
                              ),
                            ],
                          ),
                        ),
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
}
