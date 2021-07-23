import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/constants/color_constants.dart';
import 'package:flutter_app/src/common/constants/padding_constants.dart';
import 'package:flutter_app/src/common/widgets/custom_button.dart';
import 'package:flutter_app/src/common/widgets/custom_text_field.dart';
import 'package:flutter_app/src/common/widgets/text_field_divider.dart';
import 'package:flutter_app/src/router/routing_const.dart';
import 'package:hive/hive.dart';

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
            child: CustomButton(
              title: 'Войти',
              onPressed: () async {
                
                Box tokensBox = Hive.box('tokens');

                try {
                  Response response = await dio.post(
                    'http://api.codeunion.kz/api/v1/auth/login',
                    data: {
                      'email': emailController.text,
                      'password': passwordController.text,
                    },
                  );

                  tokensBox.put(
                      'access', response.data['tokens']['accessToken']);
                  tokensBox.put(
                      'refresh', response.data['tokens']['refreshToken']);

                  print(tokensBox.get('access'));
                  print(tokensBox.get('refresh'));

                  Navigator.pushReplacementNamed(context, MainRoute);
                } on DioError catch (e) {
                  print(e.response!.data);
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('Ошибка'),
                        content: Text('Неправильный логин или пароль!'),
                        actions: [
                          CupertinoButton(
                            child: Text('ОК'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    },
                  );
                  throw e;
                }
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
