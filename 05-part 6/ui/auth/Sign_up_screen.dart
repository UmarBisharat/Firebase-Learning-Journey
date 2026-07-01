import 'package:flutter/material.dart';
import 'package:untitled/ui/auth/login_screen.dart';
import 'package:untitled/widgets/round_buttons.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 final emailController = TextEditingController();
 final passwordController = TextEditingController();
 final _formKey = GlobalKey<FormState>();
 @override
 void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
              key: _formKey,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign Up',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.pinkAccent),),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'email',
                      prefixIcon: Icon(Icons.mail_outline),
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
                  SizedBox(height: 30),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'password',
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
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
                  SizedBox(height: 30),
                  RoundButtons(title: 'Sign Up', onPress: (){
              if(_formKey.currentState!.validate());
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Already have an account??"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                      }, child: Row(
                        children: [
                          Text('Sign In')
                        ],
                      )),
                    ],
                  ),
                ],
              ),

            ],
          )),
        ],
      ),
    );
  }
}
