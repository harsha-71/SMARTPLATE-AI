
/*

import 'package:flutter/material.dart';
import 'package:geminiproject/demorecipegemini/home.dart';
class Loginapp extends StatefulWidget {
  const Loginapp({super.key});

  @override
  State<Loginapp> createState() => _LoginappState();
}

class _LoginappState extends State<Loginapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
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
                  'Sign In',
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

                    onPressed: () {
                      Navigator.pop(context); // Close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePager()), // Replace BodyTrackPage with the actual name of your body track page
                      );
                      // Implement sign-in logic here
                    },
                    child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),),
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
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        // Implement navigation to create account screen
                      },
                      child: Text(
                        'Create Account',
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



 */





import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geminiproject/Registerscreen.dart';
import 'package:geminiproject/demorecipegemini/home.dart';


class loginpage extends StatefulWidget {
const loginpage({super.key});

@override
State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
final TextEditingController _email = TextEditingController();
final TextEditingController _pass=TextEditingController();

Future<void> _signInWithEmailandPassword(BuildContext context)async{
try{
UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(
email:_email.text,
password:_pass.text,
);
/*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:Text("Successsful Login..."),
      ));*/
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => HomePager(), // Pass 'name' correctly here
),
);
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
'Sign In',
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
onPressed: ()=>_signInWithEmailandPassword(context),
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
Text("Don't have an account? "),
GestureDetector(
onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RegisterApp(), // Pass 'name' correctly here
    ),
  );


},
child: Text(
'Create Account',
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

