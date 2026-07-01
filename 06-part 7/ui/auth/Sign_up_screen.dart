import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/Utils/utils.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false; // Loading is off initially.

  void SignUp(){
    if (_formKey.currentState!.validate()) { // First validate all form fields.
      setState(() {
        loading = true; // Show the loading indicator.
      });
      _auth.createUserWithEmailAndPassword( // Registers a new user with the given email and password.
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ).then((value) { // Show a success message after successful registration.
        Utils().toastMessage(
            "Registration successful");

        setState(() {
          loading = false; // Registration is finished, so stop loading.
        });
      })
          .onError((error, stackTrace) { // Show the error message.
        Utils().toastMessage(error.toString());

        setState(() {
          loading = false; // Registration is finished, so stop loading.
        });
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                  ),
                ),
                const SizedBox(height: 20),

                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.mail_outline),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter email';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 30),

                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter password';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 30),

                RoundButtons(
                  title: 'Sign Up',
                  loading: loading, // Pass the SignUpScreen loading value to the RoundButtons.
                  onPress: () {
SignUp();
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text('Sign In'),
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