import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Utils/utils.dart';
import 'package:untitled/post/post_screen.dart';
import 'package:untitled/ui/auth/Sign_up_screen.dart';
import 'package:untitled/widgets/round_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  void dispose(){
    super.dispose();
   emailController.dispose();
   passwordController.dispose();
  }

  void login(){
    setState(() {
      loading = true;
    });
    _auth.signInWithEmailAndPassword(email: emailController.text.trim(),
        password: passwordController.text.trim(),
    ).then((value){
      setState(() {
        loading = false;
      });
      Navigator.push(context,MaterialPageRoute(builder: (context)=>
      PostScreen()));
      Utils().toastMessage(value.user!.email.toString()); // Display the user's email after login.
    }).onError((error,stackTrace){
      setState(() {
        loading = false;
      });
      debugPrint(error.toString()); // Print the error in the console.
      Utils().toastMessage((error.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return true;
      },
      child: Scaffold(
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Form(
          key: _formKey,
          child: Column(
        children: [
          Text('Sign In',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.pinkAccent),),
          SizedBox(height: 20),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'email',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'enter email';
              }
              else{
               return null;
              }
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              suffixIcon: Icon(Icons.remove_red_eye_outlined),
              hintText: 'password',
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'enter password';
              }
              return null;
            },
          ),
        ],
      )),
      SizedBox(height: 20),
      RoundButtons(title: 'Log In',
          loading: loading,
          onPress: (){
      if(_formKey.currentState!.validate()){
        login();
      }
      }),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Don't have an account??"),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
          }, child: Row(
            children: [
              Text('Sign Up')
            ],
          )),
        ],
      ),
        ],
      ),
      ),
    );
  }
}
