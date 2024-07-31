import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';


// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final db=FirebaseFirestore.instance;

  signUp(String nm,String city)async {
    await db.collection("emp").add({'nm':nm,'city':city});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ggg"),),
      body:
      Container(
        color: Colors.indigo,
        child:
        Center(
            child: MaterialButton(
              child: Text("Click Me"),
              onPressed:(){
                signUp("AAA","Kolhapur");
              },

            )
        ),
      ),backgroundColor: Colors.pink,
      drawer: const Drawer(),
    );
  }
}