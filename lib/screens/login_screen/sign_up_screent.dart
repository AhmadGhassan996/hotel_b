
import 'package:flutter/material.dart';
import 'package:hotel_b/screens/login_screen/widgets/sign_up_body.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String namedRout='/sign_up_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignUpBody(),);
  }
}
