import 'package:amazon/bloc/add_cart/add_car_cubit.dart';
import 'package:amazon/enums/toast_states.dart';
import 'package:amazon/services/toastConfig.dart';
import 'package:amazon/src/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/single_item_screan.dart';
import 'botton_component.dart';

class ItemCard extends StatelessWidget {
  ItemCard({super.key, required this.name, required this.price,required this.id});
  String name;
  String price;
  String id;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () => AppNavigator.appNavigator(context, true, SingleItem(name:name ,price:price ,id: id,)),
 
      child: Card(
        elevation: 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.w,
              child: Image.network(
                  'https://www.freepnglogos.com/uploads/mobile-png/samsung-mobile-png-14.png'),
            ),
            Text(
              '${name}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '${price} \$',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            BlocConsumer<AddCartCubit, AddCarState>(
              listener: (context, state) {
              
              },
              builder: (context, state) {
                var cubit=AddCartCubit.get(context);
                return Padding(
              padding: const EdgeInsets.all(14.0),
              child: Button(
                name: 'Add Cart',
                function: () {
                  
                cubit.add(id:int.parse(id) , name: name, price: int.parse(price));
                ToastConfig.showToast(msg: 'add Success', toastStates: ToastStates.Success);
                },
                Width: 120,
              ),
            );
              },
            )
          ],
        ),
      ),
    );
  }
}
