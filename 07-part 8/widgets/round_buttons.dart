import 'package:flutter/material.dart';

class RoundButtons extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool loading;
  const RoundButtons({super.key, required this.title,required
  this.onPress, this.loading = false});

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
        child: Center(child: loading ? CircularProgressIndicator(strokeWidth: 3,color: Colors.white,) : Text(title,style: TextStyle(
          color: Colors.white,
        ),),),
      ),
    );
  }
}
