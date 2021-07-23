import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/constants/color_constants.dart';
import 'package:flutter_app/src/router/router.dart';
import 'package:flutter_app/src/router/routing_const.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tokens');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRoute = AuthRoute;

  @override
  void initState() {
    Box tokensBox = Hive.box('tokens');

    if (tokensBox.get('access') != null || tokensBox.get('refresh') != null) {
      initialRoute = MainRoute;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: initialRoute,
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        barBackgroundColor: AppColors.white,
      ),
    );
  }
}
