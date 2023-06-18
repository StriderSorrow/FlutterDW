import 'package:dw_front/cubit/authorization/cubit.dart';
import 'package:dw_front/cubit/navigation/navigation_cubit.dart';
import 'package:dw_front/ui/widgets/strider_button.dart';
import 'package:dw_front/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationConfirmScreen extends StatelessWidget {
  const AuthorizationConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<AuthorizationCubit>();
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                        child: StriderButton(
                            text: "Отправить код на E-mail повторно",
                            func: () {
                              context.read<AuthorizationCubit>().authorizer();
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: StriderButton(
                            text: "Подтвердить код", func: _cubit.confirm),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: StriderButton(
                            text: "Назад", func: _cubit.readyState),
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
                          text: "Регистрация",
                          func: () {
                            context
                                .read<NavigationCubit>()
                                .pushToRegistrationScene();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
