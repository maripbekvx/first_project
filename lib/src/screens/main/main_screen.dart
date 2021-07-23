import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/router/router.dart';
import 'package:flutter_app/src/screens/auth/auth_screen.dart';
import 'package:flutter_app/src/screens/register/register_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.gift)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            onGenerateRoute: AppRouter.generateRoute,
            builder: (context) {
              switch (index) {
                case 0:
                  return AuthScreen();
                case 1:
                  return RegisterScreen();
                case 2:
                  return AuthScreen();
                case 3:
                  return RegisterScreen();
                default:
                  return RegisterScreen();
              }
            },
          );
        },
      ),
    );
  }
}
