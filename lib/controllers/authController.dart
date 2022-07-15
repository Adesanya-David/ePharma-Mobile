import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/const.dart';
import 'package:image_picker/image_picker.dart';

class AuthController{

  _uploadImagetoStorage(Uint8List image)async{
    Reference ref = firebaseStorage.ref()
        .child('profilePictures')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(image);
      TaskSnapshot snap = await uploadTask;
      String downloadUrl = await snap.ref.getDownloadURL();
      return downloadUrl;
  }

  //Select profile picture function
  pickImage(ImageSource source)async{
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if(_file != null){
      return await _file.readAsBytes();
    }
    else{
      print('No image selected');
    }
  }

  //Sign Up function
  Future <String> signUp (String full_name, String username, String email, String password, Uint8List? image) async{
    String res = "An error occurred";
    try{
      if(full_name.isNotEmpty && username.isNotEmpty && password.isNotEmpty && email.isNotEmpty && image != null){
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

        String downloadUrl = await _uploadImagetoStorage(image);

        await firebaseStore.collection('users').doc(cred.user!.uid).set({
          'fullName' : full_name,
          'username' : username,
          'email' : email,
          'image' : downloadUrl,
        });
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

Future <String> logIn (String full_name, String username, String email, String password, Uint8List? image) async{
  String res = "An error occurred";
  try{
    if(full_name.isNotEmpty && username.isNotEmpty && password.isNotEmpty && email.isNotEmpty && image != null){
      UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      // String downloadUrl = await _uploadImagetoStorage(image);

      await firebaseStore.collection('users').doc(cred.user!.uid).set({
        'fullName' : full_name,
        'username' : username,
        'email' : email,
        // 'image' : downloadUrl,
      });
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

  showSnackBar(String content, BuildContext context){
      ScaffoldMessenger.of(context).showSnackBar(showSnackBar(content, (context)));
  }