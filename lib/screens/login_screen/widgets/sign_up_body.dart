import 'package:flutter/material.dart';
import 'package:hotel_b/providers/auth_provider.dart';
import 'package:hotel_b/screens.dart';
import 'package:hotel_b/screens/hotel_screen/hotel_screen.dart';
import 'package:hotel_b/screens/login_screen/widgets/log_in_body.dart';
import 'package:provider/provider.dart';

class SignUpBody extends StatelessWidget {


  final _globalKey = GlobalKey<FormState>();
  String _userName = '';
  String _password = '';
  String _email = '';
  bool _sucre = true;

  void getPassword(String password) {
    _password = password;
  }

  void getEmail(String email) {
    _email = email;
  }

  @override
  Widget build(BuildContext context) {
    var isLoading = context
        .watch<AuthProvider>()
        .isLoading;
    return isLoading
        ? Center(
      child: CircularProgressIndicator(),
    )
        : SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          //   key: _globalKey,
          child: Column(
            children: [
              userNameTextField(),
              SizedBox(
                height: 10,
              ),
              emailTextField(),
              SizedBox(
                height: 10,
              ),
              passwordTextField(),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    // final isValid = _globalKey.currentState!.validate();
                    // if (isValid) {
                    //   _globalKey.currentState!.save();
                    //
                    //   context
                    //       .read<AuthProvider>()
                    //       .signUpUser(_email, _password);

                    context
                        .read<AuthProvider>()
                        .signUpUser(_email, _password);
                    print('Email; $_email');
                    print('password:$_password');
                       Navigator.of(context).pushNamed(Screens.namedRout);

                    // }

                  },
                  child: Text(" SIGN UP"))
            ],
          ),
        ),
      ),
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      onChanged: getPassword,
      obscureText: _sucre,
      validator: (value) {
        if (value!.isEmpty) {
          return " please enter a password";
        } else if (value.length < 4) {
          return "please enter valid password";
        } else {
          return null;
        }
      },
      // onSaved: (value) => setState(() => _password = value!),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            // setState(() {
            //   _sucre = !_sucre;
            // });
          },
          icon: Icon(_sucre ? Icons.visibility : Icons.visibility_off),
        ),
        labelText: "Enter password",
        filled: false,
        fillColor: Colors.grey[300],
        prefixIcon: Icon(Icons.lock),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.transparent),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  } //password Widget

  Widget userNameTextField() {
    return TextFormField(

      validator: (value) {
        if (value!.isEmpty) {
          return " please enter a user name";
        } else if (value.length < 4) {
          return "please enter valid user name";
        } else {
          return null;
        }
      },
      //onSaved: (value) => setState(() => _userName = value!),
      decoration: InputDecoration(
        labelText: " UserName",
        filled: false,
        fillColor: Colors.grey[300],
        prefixIcon: Icon(Icons.person_outline_rounded),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10.0),
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.transparent),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  } // User Name Text Field

  Widget emailTextField() {
    return TextFormField(
      onChanged: getEmail,
      validator: (value) {
        if (value!.isEmpty) {
          return " please enter a email";
        } else if (value.length < 4) {
          return "please enter valid email";
        } else {
          return null;
        }
      },
      onSaved: (value) => getEmail,
      decoration: InputDecoration(
        labelText: " Email",
        filled: false,
        fillColor: Colors.grey[300],
        prefixIcon: Icon(Icons.email_outlined),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.transparent),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  } // Email Text Field
}

