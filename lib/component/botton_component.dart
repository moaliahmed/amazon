import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Button extends StatelessWidget {
  Button({required this.name,required this.function, this.Width=360});
String name;
double Width;
VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
     onTap: function,
      child: Container(
                    decoration: BoxDecoration( color: Color(0xff214eff)),
                    width: Width,
                    height: 40,
                    child: Center(child: Text(name,style: TextStyle(fontSize: 18,color: Colors.white),)),
                   ),
    );
  }
}