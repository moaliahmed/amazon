import 'package:amazon/bloc/add_cart/add_car_cubit.dart';
import 'package:amazon/component/item_cart_card.dart';
import 'package:amazon/enums/toast_states.dart';
import 'package:amazon/screens/home_screen.dart';
import 'package:amazon/services/toastConfig.dart';
import 'package:amazon/src/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScrean extends StatefulWidget {
  const CartScrean({super.key});

  @override
  State<CartScrean> createState() => _CartScreanState();
}

int screen = 1;

class _CartScreanState extends State<CartScrean> {
  @override
  void initState() {
    AddCartCubit.get(context).getTotel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: BlocConsumer<AddCartCubit, AddCarState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = AddCartCubit.get(context);

                return Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () => AppNavigator.appNavigator(
                                  context, true, HomeScrean()),
                              icon: Icon(Icons.arrow_back_rounded)),
                          TextButton(
                              onPressed: () {
                                screen = 1;
                                setState(() {});
                              },
                              child: Text(
                                'summary',
                                style: TextStyle(fontSize: 24),
                              )),
                          TextButton(
                              onPressed: () {
                                screen = 2;
                                setState(() {});
                              },
                              child: Text(
                                'payment',
                                style: TextStyle(fontSize: 24),
                              )),
                        ],
                      ),
                      screen == 2
                          ? Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Subtotal',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        Text('${cubit.total}',
                                            style: TextStyle(fontSize: 24))
                                      ],
                                    ),
                                  ),
                                  Divider(
                                      thickness: 2, indent: 20, endIndent: 20),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Shopping',
                                            style: TextStyle(fontSize: 24)),
                                        Text('19',
                                            style: TextStyle(fontSize: 24))
                                      ],
                                    ),
                                  ),
                                  Divider(
                                      thickness: 2, indent: 20, endIndent: 20),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Total',
                                            style: TextStyle(fontSize: 24)),
                                        Text('${cubit.total + 19}',
                                            style: TextStyle(fontSize: 24))
                                      ],
                                    ),
                                  ),
                               ElevatedButton(onPressed: () => ToastConfig.showToast(msg: 'payment Success', toastStates: ToastStates.Success), child: Text('Payment'))
                                ],
                              ),
                            )
                          : Container(
                              child: Column(
                              children: [
                                Divider(
                                  thickness: 2,
                                ),
                                ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: cubit.cartlenght,
                                  itemBuilder: (context, index) => ItemCart(
                                    index: index,
                                  ),
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Subtotal',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text('${cubit.total}',
                                          style: TextStyle(fontSize: 24))
                                    ],
                                  ),
                                ),
                                Divider(
                                    thickness: 2, indent: 20, endIndent: 20),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Shopping',
                                          style: TextStyle(fontSize: 24)),
                                      Text('19', style: TextStyle(fontSize: 24))
                                    ],
                                  ),
                                ),
                                Divider(
                                    thickness: 2, indent: 20, endIndent: 20),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Total',
                                          style: TextStyle(fontSize: 24)),
                                      Text('${cubit.total + 19}',
                                          style: TextStyle(fontSize: 24))
                                    ],
                                  ),
                                ),
                              ],
                            ))
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
