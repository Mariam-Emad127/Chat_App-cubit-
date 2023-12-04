
import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
    CustomButon({this.onTab,required this.text});
String text;
VoidCallback ? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(child: Text(text)),
      ),
    );
  }
}
