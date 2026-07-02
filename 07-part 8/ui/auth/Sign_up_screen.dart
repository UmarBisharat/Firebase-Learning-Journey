import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Utils/utils.dart';
import 'package:untitled/ui/auth/login_screen.dart';
import 'package:untitled/widgets/round_buttons.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void SignUp(){
    if(_formKey.currentState!.validate()){
      setState(() {
        loading = true;
      });
      _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()).then(
              (value){
            Utils().toastMessage('ho gyaaaaaaaa');
            setState(() {
              loading = false;
            });
          }

      ).onError(
              (error,stackTrace){
            Utils().toastMessage(error.toString());
            setState(() {
              loading = false;
            });
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
Form(
    key: _formKey,
    child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('Sign Up',style: TextStyle(color: Colors.deepPurple,fontSize: 20,fontWeight: FontWeight.bold),),
    SizedBox(height: 20),
    TextFormField(
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'email',hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(Icons.email_outlined,color: Colors.white),
        fillColor: Colors.deepPurple,
        filled: true,
      ),
      validator: (value){
        if(value!.isEmpty){
          return 'enter password';
        }
        else{
          return null;
        }
      },
    ),
    SizedBox(height: 20),
    TextFormField(
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      controller: passwordController,
      decoration: InputDecoration(
        hintText: 'password',hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(Icons.lock_outline,color: Colors.white),
        suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.white),
        fillColor: Colors.deepPurple,
        filled: true,
      ),
      validator: (value){
        if(value!.isEmpty){
          return 'enter password';
        }
        else{
          return null;
        }
      },
    ),
SizedBox(height: 20),
    RoundButtons(title: 'Sign Up',
        loading: loading,
        onPress: (){
      SignUp();

    }),
    SizedBox(height: 20,),
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account ?"),
        TextButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
        }, child: Text('Sign In')),
      ],
    )
  ],
))
        ],
      ),
    );
  }
}
