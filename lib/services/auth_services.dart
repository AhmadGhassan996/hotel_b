import 'dart:convert';

import 'package:hotel_b/models/auth_data.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<AuthData?> singUpUser(String email, String password) async {
    var res = await http.post(Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBEXpWAv8H7TrSl5irAaf9P35mDIBreYNs'),
        body:json.encode({
        'email': email,
        'password': password,
        'returnSecureToken':true
        }));

    if(res.statusCode==200){
      return AuthData.fromJson(json.decode(res.body));
    }
return null;
  }

  Future<AuthData?> singInUser(String email, String password) async {
    var res = await http.post(Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBEXpWAv8H7TrSl5irAaf9P35mDIBreYNs'),
        body:json.encode({
          'email': email,
          'password': password,
          'returnSecureToken':true
        }));

    if(res.statusCode==200){
      return AuthData.fromJson(json.decode(res.body));
    }
    return null;
  }

}



