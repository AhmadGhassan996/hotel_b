
import 'package:flutter/cupertino.dart';
import 'package:hotel_b/models/auth_data.dart';
import 'package:hotel_b/services/auth_services.dart';

class AuthProvider with ChangeNotifier{
  AuthService _authService=AuthService();
  bool isLoading= false;
  AuthData? authData;

 var isLogedIn;
  
  Future<void> signUpUser(String email,String password)async{
    isLoading=true;
    notifyListeners();
    authData=await _authService.singUpUser(email, password);

    isLoading=false;
    notifyListeners();
  }

  Future<void> signInUser(String email,String password)async{
    isLoading=true;
    notifyListeners();
    authData=await _authService.singInUser(email, password);
    isLogedIn=authData!.userId;
    print('is loged in $isLogedIn');
    isLoading=false;
    notifyListeners();
  }
  
}