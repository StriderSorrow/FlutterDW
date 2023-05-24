import 'package:dw_front/ui/widgets/number_button.dart';
import 'package:dw_front/ui/widgets/strider_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_front/cubit/character/cubit.dart';
import 'package:dw_front/ui/widgets/strider_drawer.dart';

import '../widgets/text_button.dart';

class Character extends StatelessWidget {
  const Character({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
      var _cubit = context.read<CharacterCubit>();
      if (state is CharacterEmptyState) {
        _cubit.readyState();
      }
      if (state is CharacterLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is CharacterReadyState) {
        return Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: const Text("Character_profile"),
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
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Character_name",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Column(
                          children: const [
                            Text("Персонаж из проекта project_name"),
                            Text("Действующий актёр - actor_name"),
                          ],
                        ),
                        const StriderDivider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            NumberButton(number: "0", text: "кандидатов"),
                            NumberButton(number: "0", text: "аудиодорожек"),
                          ],
                        ),
                        const StriderDivider(),
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
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: const Text("Открыть сценарий роли"),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
