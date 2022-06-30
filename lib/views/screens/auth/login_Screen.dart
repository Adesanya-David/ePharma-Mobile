
import 'package:flutter/material.dart';
import 'package:flutter_app/const.dart';
import 'package:flutter_app/views/screens/auth/signUp_Screen.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.grey,
                ),
                Positioned(
                  right: 5,
                  bottom: 1,
                  child: Icon(Icons.add_a_photo),

                )
              ],
            ),
            // Text("Welcome, Please Enter your details to unlock Maximum potentials", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(
              height: 40,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                hintText: 'Enter Email Address',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width -40,
              height: 50,
              decoration: BoxDecoration(
                color: buttonColor,
              ),
              child: Center(
                  child: InkWell(
                      onTap: (){
                        print('Login Successful');
                      },
                      child: Text('Login', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),))
                ,)
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Need an account?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
                SizedBox(
                  width: 6,
                ),
                InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Signup()));
                    },
                    child: Text('Sign Up!', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),))
              ],
            )

          ],
        ),
      )
    );
  }
}