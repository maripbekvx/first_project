import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/common/constants/color_constants.dart';
import 'package:flutter_app/src/common/widgets/custom_button.dart';
import 'package:flutter_app/src/common/widgets/custom_text_field.dart';
import 'package:flutter_app/src/common/widgets/text_field_divider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text('Регистрация'),
        border: Border(),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 32),
            Container(
              color: CupertinoColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(placeholder: 'Логин'),
                  TextFieldDivider(),
                  CustomTextField(placeholder: 'Телефон'),
                  TextFieldDivider(),
                  CustomTextField(placeholder: 'Почта'),
                  TextFieldDivider(),
                  CustomTextField(
                    placeholder: 'Пароль',
                    suffix: CupertinoButton(
                      child: Icon(
                        CupertinoIcons.eye_slash,
                        color: CupertinoColors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                title: 'Создать аккаунт',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
