import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/authController.dart';
// import 'package:flutter_app/views/screens/auth/login_Screen.dart';
import 'package:flutter_app/views/screens/auth/loginpage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../const.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // const Signup({Key? key}) : super(key: key);
  final TextEditingController _fullnameController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  Uint8List? _image;

  selectImage() async {
    Uint8List im = await AuthController().pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            children: [
              _image != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.grey,
                      backgroundImage: MemoryImage(_image!))
                  : CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBwgJx82LA3WoY4OHduFMraX31HIdpLMAdmYCfY8Kdf8yx2PpeZraq9029etC_w3RrtDM&usqp=CAU'),
                    ),
              Positioned(
                  right: 5,
                  bottom: 1,
                  child: InkWell(
                      onTap: selectImage, child: Icon(Icons.add_a_photo))),
            ],
          ),
          // Text("Welcome, Please Enter your details to unlock Maximum potentials", style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(
            height: 40,
          ),
          TextField(
            controller: _fullnameController,
            decoration: InputDecoration(
                filled: true,
                hintText: 'Enter Full Name',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
                filled: true,
                hintText: 'Enter Username',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
                filled: true,
                hintText: 'Enter Email Address',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
                filled: true,
                hintText: 'Enter Password',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
          // SizedBox(
          //   height: 15,
          // ),
          // Container(
          //     width: MediaQuery.of(context).size.width - 40,
          //     height: 50,
          //     decoration: BoxDecoration(
          //       color: buttonColor,
          //     ),
          //     child: Center(
          //       child: InkWell(
          //           onTap: () {
          //             print('Account Created Successfully');
          //           },
          //           child: InkWell(
          //               onTap: () async {
          //                 await AuthController().signUp(
          //                     _fullnameController.text,
          //                     _usernameController.text,
          //                     _emailController.text,
          //                     _passwordController.text,
          //                     _image);
          //               },
          //               child: Text(
          //                 'Sign Up',
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.bold, fontSize: 20),
          //               ))),
          //     )),
          // SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       'Already have an account?',
          //       style: TextStyle(
          //         fontSize: 15,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: () async {
              await AuthController().signUp(
                  _fullnameController.text,
                  _usernameController.text,
                  _emailController.text,
                  _passwordController.text,
                  _image);
            },
            height: 45,
            color: Colors.blueGrey,
            child: Text(
              "Sign Up",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ]),
      ),
    ));
  }
}
