import 'package:amazon/component/contact_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../src/navigation_helper.dart';
import 'home_screen.dart';

class ContactScrean extends StatelessWidget {
  const ContactScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        AppNavigator.appNavigator(context, true, HomeScrean());
                      },
                      icon: Icon(Icons.arrow_back_rounded)),
                  Text(
                    'contact Us ',
                    style: TextStyle(fontSize: 22),
                  )
                ],
              ),
             SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column( children: [   
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.phone),
        
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '+201113036517',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text('mobile')
                      ],
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                  indent: 12,
                  endIndent: 12,
                  color: Colors.blue[100],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.mail_outline),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'mohamedalir2002@gmail.com',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text('Home')
                      ],
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                  indent: 12,
                  endIndent: 12,
                  color: Colors.blue[100],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.label_outline),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '+12345678',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text('portatile Message')
                      ],
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                  indent: 12,
                  endIndent: 12,
                  color: Colors.blue[100],
                ),
                       ], ),
             ),
             Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            'Send Massge',
                            style: TextStyle(fontSize: 22, color: Colors.blue),
                          ),
                        ],
                      ),
              Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: 8.h, vertical: 14.w),
                      child: TextFormField(
                        decoration: const InputDecoration(
                        
                          border: OutlineInputBorder(),
                          labelText: ' Name ',
                        ),
                        
                      ),
                    ),
                   
              Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: 8.h, vertical: 10.w),
                      child: TextFormField(
                        decoration: const InputDecoration(
                        
                          border: OutlineInputBorder(),
                          labelText: ' Email  ',
                        ),
                        
                      ),
                    ),
              Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: 8.h, vertical: 10.w),
                      child: TextFormField(
                        
                        decoration: const InputDecoration(
                         contentPadding: EdgeInsets.symmetric(vertical: 90),
                          border: OutlineInputBorder(),
                          labelText: ' massage  ',
                          hintText: 'massage'
                        ),
                        
                      ),
                    ),
             
                   
            ],
          ),
        ),
      ),
    );
  }
}
