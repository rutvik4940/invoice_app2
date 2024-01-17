import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed( const Duration(seconds:3),() => Navigator.pushReplacementNamed(context, 'home'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("assets/imges/invoice2.jpg",height: 150,width: 150,),
            ),
            Text("Welcom to Invoice",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
