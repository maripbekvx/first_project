import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/screens/auth/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}
