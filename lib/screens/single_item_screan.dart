import 'package:amazon/bloc/add_cart/add_car_cubit.dart';
import 'package:amazon/screens/home_screen.dart';
import 'package:amazon/src/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../enums/toast_states.dart';
import '../services/toastConfig.dart';

class SingleItem extends StatelessWidget {
   SingleItem({super.key,required this.name,required this.price,required this.id});
String name;
String price;
String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:BlocConsumer<AddCartCubit, AddCarState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                var cubit=AddCartCubit.get(context);
                return  Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  IconButton(onPressed: () {
                    AppNavigator.appNavigator(context, true, HomeScrean());
                  }, icon: Icon(Icons.arrow_back)),
                  Text('$name',style: TextStyle(fontSize: 24)),
                  Icon(Icons.shopping_cart,size: 28,)
                ],),
                Container(child: Image.network('https://www.freepnglogos.com/uploads/mobile-png/samsung-mobile-png-14.png'),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text('$name',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                    Text('$price Egy',style: TextStyle(fontSize: 24))
                  ],),
                ),
                Container(
                  
                  child: Text('The latest MacBook Air, powered by Apple’s M2 processor, is the best laptop for most people.The base model, which includes 8GB of memory, 256GB of storage, an 8-core CPU, and an 8-core GPU, starts at \$1,199. A model with 512GB of storage, which is what we recommend for most people and will let you keep using the laptop for longer, costs \$1,399.The Air has lost the wedge-shape design that was its calling card for years but retains many of the other excellent features of years past, including MagSafe charging, Touch ID, and the scissor-switch keyboard, and adds a new 1080p webcam and two new color options.',style: TextStyle(fontSize: 16)),),
                  
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [ElevatedButton(onPressed: () {
                 cubit.add(id:int.parse(id) , name: name, price: int.parse(price));
              ToastConfig.showToast(msg: 'add Success', toastStates: ToastStates.Success);
                }, child: Text('add Cart'))],)
              ],
            )
          ;
              },
            ) ),
        ),
      ),
    );
  }
}