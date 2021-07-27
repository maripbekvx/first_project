import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/constants/color_constants.dart';
import 'package:flutter_app/src/common/constants/padding_constants.dart';
import 'package:flutter_app/src/common/widgets/custom_button.dart';
import 'package:flutter_app/src/common/widgets/custom_text_field.dart';
import 'package:flutter_app/src/common/widgets/text_field_divider.dart';
import 'package:flutter_app/src/router/routing_const.dart';
import 'package:flutter_app/src/screens/auth/bloc/log_in_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Dio dio = Dio();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: Border(),
        middle: Text('Авторизация'),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  controller: emailController,
                  placeholder: 'Логин или почта',
                ),
                TextFieldDivider(),
                CustomTextField(
                  controller: passwordController,
                  placeholder: 'Пароль',
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: AppPaddings.horizontal,
            child: BlocConsumer<LogInBloc, LogInState>(
              listener: (context, state) {
                if (state is LogInLoaded) {
                  Navigator.pushReplacementNamed(context, MainRoute);
                } else if (state is LogInFailed) {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('Ошибка'),
                        content: Text(state.message ?? ''),
                        actions: [
                          CupertinoButton(
                            child: Text('ОК'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  title: 'Войти',
                  onPressed: state is LogInLoading
                      ? null
                      : () {
                          context.read<LogInBloc>().add(
                                LogInPressed(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                        },
                );
              },
            ),
          ),
          SizedBox(height: 19),
          Padding(
            padding: AppPaddings.horizontal,
            child: CustomButton(
              title: 'Зарегистрироваться',
              onPressed: () {
                Navigator.pushNamed(context, RegisterRoute);
              },
            ),
          ),
        ],
      ),
    );
  }
}
