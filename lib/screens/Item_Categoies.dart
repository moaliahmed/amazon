import 'package:amazon/bloc/Item_CAtegories/item_categories_cubit.dart';
import 'package:amazon/component/item_Card.dart';
import 'package:amazon/screens/home_screen.dart';
import 'package:amazon/src/navigation_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCategoriesScrean extends StatefulWidget {
  ItemCategoriesScrean({super.key, required this.number});
  int number;

  @override
  State<ItemCategoriesScrean> createState() => _ItemCategoriesScreanState();
}

class _ItemCategoriesScreanState extends State<ItemCategoriesScrean> {
  @override
  void initState() {
    ItemCategoriesCubit.get(context).getItem(number: widget.number);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,leading: IconButton(onPressed: ()=>AppNavigator.appNavigator(context, true, HomeScrean()), icon: Icon(Icons.arrow_back_rounded),color: Colors.black,)),
      body: Container(
          child: BlocConsumer<ItemCategoriesCubit, ItemCategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ItemCategoriesCubit.get(context);
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: .8,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 15),
              itemCount: cubit.itemcategories?.data?.length,
              itemBuilder: (BuildContext context, int index) => SizedBox(
                  height: 300,
                  child: ItemCard(
                    name: '${cubit.itemcategories?.data?[index].name}',
                    price: '${cubit.itemcategories?.data?[index].price}',
                    id: '${cubit.itemcategories?.data?[index].id}',
                    
                  )));
        },
      )),
    );
  }
}
