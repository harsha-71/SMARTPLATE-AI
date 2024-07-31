import 'package:flutter/material.dart';
import 'package:geminiproject/Loginscreen.dart';

class RegisterApp extends StatefulWidget {
  const RegisterApp({Key? key}) : super(key: key);

  @override
  State<RegisterApp> createState() => _RegisterAppState();
}

class _RegisterAppState extends State<RegisterApp> {
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
                  'Register',
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
                      labelText: 'Name',
                      hintText: 'Enter your name',
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
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      hintText: 'Enter your email',
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
                      // Implement registration logic here
                    },
                    child: Text(
                      'Register',
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
                    Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => loginpage()),
                        );
                        // Implement navigation to login screen
                      },
                      child: Text(
                        'Log In',
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
