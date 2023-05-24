import 'package:dw_front/ui/widgets/number_button.dart';
import 'package:dw_front/ui/widgets/strider_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_front/cubit/user/cubit.dart';
import 'package:dw_front/ui/widgets/strider_drawer.dart';

import '../widgets/text_button.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      var _cubit = context.read<UserCubit>();
      if (state is UserEmptyState) {
        _cubit.readyState();
      }
      if (state is UserLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is UserReadyState) {
        return Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: const Text("User_profile"),
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
                                  children: const [
                                    Text(
                                      "User_name User_surname",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("UserStatus"),
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
                                      children: const [
                                        Icon(Icons.house),
                                        Text("Town: Rostov-on-Don"),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Icon(Icons.alarm),
                                        Text("Time zone: UTC+3"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const StriderDivider(),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Center(child: NumberButton(number: "0", text: "друзей")),
                                VerticalDivider(),
                                NumberButton(number: "0", text: "коллективов"),
                                VerticalDivider(),
                                NumberButton(number: "0", text: "проектов"),
                                VerticalDivider(),
                                NumberButton(number: "0", text: "аудиодорожек"),
                                VerticalDivider(),
                                NumberButton(number: "0", text: "активных задач"),
                              ],
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
      return const SizedBox.shrink();
    });
  }
}
