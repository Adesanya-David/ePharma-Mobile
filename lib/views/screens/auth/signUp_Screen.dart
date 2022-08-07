// ignore_for_file: unused_import

import 'dart:ffi';
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
  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasOneNumber = false;
  bool _isLoading = false;
  Uint8List? _image;

  final TextEditingController _fullnameController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasOneNumber = true;
    });
  }

  selectImage() async {
    Uint8List im = await AuthController().pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController().signUp(
        _fullnameController.text,
        _usernameController.text,
        _emailController.text,
        _passwordController.text,
        _image);
    setState(() {
      _isLoading = false;
    });

    if (res != 'Success') {
      return showSnackBar(res, context);
    } else {
      return showSnackBar('Account created successfully', context);
    }
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
                      radius: 55,
                      backgroundColor: Colors.blueGrey,
                      backgroundImage: MemoryImage(_image!))
                  : CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                          'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
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
              hintText: 'Full Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Username',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Email Address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            onChanged: (password) => onPasswordChanged(password),
            obscureText: !_isVisible,
            controller: _passwordController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                icon: _isVisible
                    ? Icon(
                        Icons.visibility,
                        color: Colors.black,
                      )
                    : Icon(Icons.visibility_off, color: Colors.grey),
              ),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black)),
              hintText: 'Password',
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _isPasswordEightCharacters
                        ? Colors.green
                        : Colors.transparent,
                    border: _isPasswordEightCharacters
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                    child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 12,
                )),
              ),
              SizedBox(
                width: 10,
              ),
              Text("Contains at least 8 Characters")
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _hasOneNumber ? Colors.green : Colors.transparent,
                    border: _hasOneNumber
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                    child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 12,
                )),
              ),
              SizedBox(
                width: 10,
              ),
              Text("Contains at least one number")
            ],
          ),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: () {
              _hasOneNumber;
              _isPasswordEightCharacters;
              signUpUser();
              _fullnameController.clear();
              _usernameController.clear();
              _emailController.clear();
              _passwordController.clear();
              _image!.clear();
            },
            height: 45,
            color: Colors.blueGrey,
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
                    "Create Account",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ]),
      ),
    ));
  }
}
