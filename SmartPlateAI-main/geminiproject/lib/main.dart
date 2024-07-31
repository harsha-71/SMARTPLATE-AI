
import 'package:flutter/material.dart';
import 'package:geminiproject/Loginscreen.dart';
import 'package:geminiproject/Registerscreen.dart';
import 'package:geminiproject/authentication_pages/login.dart';
import 'package:geminiproject/demorecipegemini/home.dart';
//import 'package:geminiproject/demorecipegemini/home.dart';
import 'package:geminiproject/demorecipegemini/splashscreen.dart';
import 'package:geminiproject/multireceipe.dart';
import 'package:geminiproject/recipepages/recipehomepage.dart';
import 'package:video_player/video_player.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

            home: splash(), //  1. splash screen
          //  home: loginpage1(), login without authentication for demo
          // home : loginpage() // from Loginscreen.dart with authentication

           // home:  HomePager(), //original API page for recipe generati
           // home:recipes(), // popular recipes page

    );
   }
}





/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:geminiproject/auth/login.dart';
import 'package:geminiproject/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Home();
            } else {
              return LoginForm();
            }
          },
        ));
  }
}


 */