import 'package:dw_front/cubit/registration/cubit.dart';
import 'package:dw_front/cubit/navigation/cubit.dart';
import 'package:dw_front/ui/widgets/strider_button.dart';
import 'package:dw_front/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationReadyScreen extends StatelessWidget {
  const RegistrationReadyScreen({super.key});

  @override

  Widget build(BuildContext context) {
    var _cubit = context.read<RegistrationCubit>();
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
                      "Dub&Web - Регистрация",
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
                        textController: _cubit.login,
                        hint: 'Логин:',
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
                      child: StriderButton(
                          text: "Зарегистрироваться",
                          func: _cubit.register),
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
                      "Уже есть аккаунт? Авторизуйтесь!",
                      style: TextStyle(
                          fontSize: 16, fontFamily: "Bookman Old Style"),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: 350,
                      height: 50,
                      child: StriderButton(
                          text: "Авторизация",
                          func: () {
                            context
                                .read<NavigationCubit>()
                                .pushToAuthorizationScene();
                          }),
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
}
