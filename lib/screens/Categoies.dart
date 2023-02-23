import 'package:amazon/bloc/get_categories/get_categories_cubit.dart';
import 'package:amazon/screens/home_screen.dart';
import 'package:amazon/src/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/categories_card.dart';

class CategoriesScrean extends StatefulWidget {
  const CategoriesScrean({super.key});

  @override
  State<CategoriesScrean> createState() => _CategoriesScreanState();
}

class _CategoriesScreanState extends State<CategoriesScrean> {
  @override
  void initState() {
    GetCategoriesCubit.get(context).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
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
                    'Categories ',
                    style: TextStyle(fontSize: 22),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'All Categories',
                    style: TextStyle(fontSize: 22, color: Colors.blue),
                  )
                ],
              ),
              SizedBox(height: 8,),
              BlocConsumer<GetCategoriesCubit, GetCategoriesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = GetCategoriesCubit.get(context);
                  return Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 2 / 2,
                                crossAxisSpacing: 25,
                                mainAxisSpacing: 15),
                        itemCount: cubit.categoriesModel?.data?.length,
                        itemBuilder: (BuildContext context, int index) =>
                            CategoriesCard(
                              color: Colors.white,
                                name:
                                    '${cubit.categoriesModel?.data![index].name}')),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
