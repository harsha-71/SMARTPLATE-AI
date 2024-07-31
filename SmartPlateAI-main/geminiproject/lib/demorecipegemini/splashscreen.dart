import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geminiproject/Loginscreen.dart';
import 'package:geminiproject/Registerscreen.dart';
import 'package:geminiproject/authentication_pages/login.dart';
import 'package:video_player/video_player.dart';



class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  void initState(){
    super.initState();

    Timer(Duration(seconds:5),(){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_)=>const loginpage())
      );
    });
  }
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent,Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
          ),

          child: Center(
            child: Expanded(child: Image.asset("lib/images/splogo.png",)),

          )
      ),
    );
  }
}

// class FullScreenVideo extends StatefulWidget {
//   @override
//   _FullScreenVideoState createState() => _FullScreenVideoState();
// }
//
// class _FullScreenVideoState extends State<FullScreenVideo> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset("lib/images/firstscreen.mp4")
//       ..initialize().then((_) {
//         setState(() {});
//         _controller.play();
//         _controller.setLooping(true);
//       });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _controller.value.isInitialized
//             ? FittedBox(
//           fit: BoxFit.cover,
//           child: SizedBox(
//             width: _controller.value.size.width,
//             height: _controller.value.size.height,
//             child: VideoPlayer(_controller),
//           ),
//         )
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }
