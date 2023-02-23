import 'dart:async';

import 'package:amazon/bloc/add_cart/add_car_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCart extends StatelessWidget {
   ItemCart({super.key,required this.index});
int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCartCubit, AddCarState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=AddCartCubit.get(context);
        cubit.rcart(index);

        return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: 65,
                  child: Image.network(
                      'https://www.freepnglogos.com/uploads/mobile-png/samsung-mobile-png-14.png')),
             
              Text(
                '${cubit.fname} ',
                style: TextStyle(fontSize: 22),
              ),
             SizedBox(width: 10,),
              Column(
                children: [
                  Text(
                    '\$ ${cubit.fprice}',
                    style: TextStyle(fontSize: 22),
                  ),
                  Text('Qty:${cubit.fqty}', style: TextStyle(fontSize: 22))
                ],
              )
           , 
           IconButton(onPressed: (){cubit.removeItem(index);}, icon: Icon(Icons.delete))
            ],
          ),
        Divider(thickness: 2,indent: 30,endIndent: 20),
        ],
      ),
    );
  
      },
    );
    }
}
