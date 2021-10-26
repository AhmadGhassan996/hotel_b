import 'package:flutter/material.dart';
import 'package:hotel_b/screens/login_screen/widgets/log_in_body.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);
  static const String namedRout='/log_in_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogInBody(),
    );
  }
}
