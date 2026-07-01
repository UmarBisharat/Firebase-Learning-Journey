import 'package:flutter/material.dart';

class RoundButtons extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const RoundButtons({super.key, required this.title,required
  this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(title,style: TextStyle(
          color: Colors.white,
        ),),),
      ),
    );
  }
}
