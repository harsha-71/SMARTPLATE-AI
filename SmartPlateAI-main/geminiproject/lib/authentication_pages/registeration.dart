import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:project/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geminiproject/authentication_pages/login.dart';


class registerpage extends StatefulWidget {
  const registerpage({super.key});

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass=TextEditingController();

  Future<void> _signUpWithEmailandPassword(BuildContext context)async{
    try{
      UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:_email.text,
        password:_pass.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:Text("User created Successsfully..."),
      ));
      /*Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => homePage(name: _email.text), // Pass 'name' correctly here
        ),
      );*/
    }
    catch(e){
      print(e.toString());

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:Text("Failed to sign In:$e"),
      ));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'lib/images/recipe.jpg',
            fit: BoxFit.cover,
          ),
          // Other Widgets on top of the background
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.10), // Background color with opacity
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: 400,
                  child: TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: 400,
                  child: TextField(
                    obscureText: true,
                    controller:_pass,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  width: 400,
                  child: ElevatedButton(
                    /* onPressed: () {

                      String name = value.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => homePage(name: name), // Pass 'name' correctly here
                        ),
                      );

                    },*/
                    onPressed: ()=>_signUpWithEmailandPassword(context),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have account ? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => loginpage1(), // Pass 'name' correctly here
                        ),
                        );
                        // Implement navigation to create account screen
                      },
                      child: Text(
                        'Log IN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
