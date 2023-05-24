import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_front/cubit/authorization/cubit.dart';
import 'package:dw_front/ui/widgets/text_field.dart';

import '../widgets/text_button.dart';

class Authorization extends StatelessWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorizationCubit, AuthorizationState>(
        builder: (context, state) {
      var _cubit = context.read<AuthorizationCubit>();
      if (state is AuthorizationEmptyState) {
        _cubit.readyState();
      }
      if (state is AuthorizationLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is AuthorizationReadyState) {
        return Scaffold(
          backgroundColor: Colors.grey,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                          "Dub&Web - Вход",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 350,
                          height: 50,
                          child: CustomTextField(
                            textController: _cubit.email,
                            hint: 'Электронная почта:',
                            obscure: false,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 350,
                          height: 50,
                          child: CustomTextField(
                            textController: _cubit.password,
                            hint: 'Пароль:',
                            obscure: true,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 350,
                          height: 50,
                          child: CustomTextButton(text: "Вход", func: () {}),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                          "Ещё нет аккаунта? Зарегистрируйтесь!",
                          style: TextStyle(fontSize: 16, fontFamily: "Bookman Old Style"),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: 350,
                          height: 50,
                          child: CustomTextButton(
                              text: "Регистрация", func: () {}),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
      if (state is AuthorizationConfirmState)
      {
        return Scaffold(
          backgroundColor: Colors.grey,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                          "Dub&Web - Авторизация",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 350,
                          height: 50,
                          child: CustomTextField(
                            textController: _cubit.emailCode,
                            hint: 'Введите код, отправленный на ваш Email:',
                            obscure: true,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 350,
                          height: 50,
                          child: CustomTextButton(text: "Подтвердить код", func: _cubit.confirm),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 350,
                          height: 50,
                          child: CustomTextButton(text: "Назад", func: _cubit.readyState),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                          "Ещё нет аккаунта? Зарегистрируйтесь!",
                          style: TextStyle(fontSize: 16, fontFamily: "Bookman Old Style"),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: 350,
                          height: 50,
                          child: CustomTextButton(
                              text: "Регистрация", func: () {}),
                        ),
                      ],
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
