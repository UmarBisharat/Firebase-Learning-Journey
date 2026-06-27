import 'package:flutter/material.dart';
import 'package:untitled/fire%20base%20services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashservices = SplashServices(); // here we initialize the splash services

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashservices.isLogin(context);//here we are checking login through splash services

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Firebase Tutorial'),),
    );
  }
}
