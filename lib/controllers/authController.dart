import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/const.dart';

class AuthController{
  Future <String> signUp (String full_name, String username, String email, String password) async{
    String res = "An error occurred";
    try{
      if(full_name.isNotEmpty && username.isNotEmpty && password.isNotEmpty && email.isNotEmpty){
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        print(cred.user!.email);
        res = 'success';
      }
      else{
        res = 'Fields cannot be empty';
      }

    }catch(e) {
      res = e.toString();
    }
    return res;
    }
  }