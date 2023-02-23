import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ContactComponent extends StatelessWidget {
   ContactComponent({super.key,required this.upName,required this.downName,required this.icon});
String upName;
String downName;
var icon;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Column(
        children: [
          Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(icon),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('${upName}',style: TextStyle(fontSize: 18),), Text('${downName}')],
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                  indent: 12,
                  endIndent: 12,
                  color: Colors.blue[100],
                )
        ],
      ),
    );
  }
}