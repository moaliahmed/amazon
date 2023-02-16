import 'package:amazon/bloc/AllItem/all_item_cubit.dart';
import 'package:amazon/bloc/get_categories/get_categories_cubit.dart';
import 'package:amazon/models/getCategories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:amazon/component/botton_component.dart';

class HomeScrean extends StatefulWidget {
  HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    GetCategoriesCubit.get(context).getCategories();
    GetCategoriesCubit.get(context).getAllItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: BlocConsumer<GetCategoriesCubit, GetCategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GetCategoriesCubit.get(context);
         
          return cubit.categoriesModel == null
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.black,
                            size: 34.r,
                          ),
                          onPressed: () {
                            scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          width: 290.w,
                          height: 50.h,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.search_rounded),
                              border: OutlineInputBorder(),
                              labelText: ' Search',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          'Categories',
                          style: TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SizedBox(
                        height: 160.0,
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.categoriesModel?.data?.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            elevation: 6,
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Colors.grey[400]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 110.w,
                                    child: Image.network(
                                        'https://www.freepnglogos.com/uploads/mobile-png/samsung-mobile-png-14.png'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 34),
                                    child: Text(
                                      '${cubit.categoriesModel?.data![index].name}',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          'Best Seller',
                          style: TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                                elevation: 6,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 100.w,
                                      child: Image.network(
                                          'https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvcm0zNTUtcGYtczczLWNhcmQtbGFwdG9wLTAxLnBuZw.png?s=VEee2Vek6oq9ytBRkAMIQFlxPIzh7cmwdKRCowpcDSE'),
                                    ),
                                    Text('Lenevo V15 Laptop'),
                                    Text('2500'),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Button(
                                        name: 'Add Cart',
                                        function: () {},
                                        Width: 120,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                    ),
                    SizedBox(height: 8,), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          'All Item',
                          style: TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:cubit.allItemModel?.data?.length ,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                                elevation: 6,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 100.w,
                                      child: Image.network(
                                          'https://www.freepnglogos.com/uploads/mobile-png/samsung-mobile-png-14.png'),
                                    ),
                                    Text('${cubit.allItemModel?.data?[index].categoryName}'),
                                    Text('${cubit.allItemModel?.data?[index].price}'),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Button(
                                        name: 'Add Cart',
                                        function: () {},
                                        Width: 120,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                    ),
                  ],
                );
        },
      ),
      drawer: Drawer(
        elevation: 10.0,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                    radius: 40.0.r,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'John Doe',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25.0.sp),
                      ),
                      SizedBox(height: 10.0.h),
                      Row(
                        children: [
                          Text(
                            'Edit',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 14.0.sp),
                          ),
                          Icon(Icons.edit)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [Icon(Icons.shopping_cart_outlined), Text('Cart')],
              ),
              onTap: () {},
            ),
            Divider(
              thickness: 1,
              endIndent: 20.w,
              indent: 20.w,
            ),
            ListTile(
              title: Row(children: [
                Icon(Icons.favorite_border_rounded),
                Text('Wish List')
              ]),
              onTap: () {},
            ),
            Divider(
              thickness: 1,
              endIndent: 20.w,
              indent: 20.w,
            ),
            ListTile(
              title: Row(children: [
                Icon(Icons.shopping_bag_outlined),
                Text('My Orders')
              ]),
              onTap: () {},
            ),
            Divider(
              thickness: 1,
              endIndent: 20.w,
              indent: 20.w,
            ),
            ListTile(
              title: Row(
                  children: [Icon(Icons.phone_outlined), Text('Content us')]),
              onTap: () {},
            ),
            Divider(
              thickness: 1,
              endIndent: 20.w,
              indent: 20.w,
            ),
            ListTile(
              title: Row(children: [
                Icon(Icons.assignment_late_outlined),
                Text('About us')
              ]),
              onTap: () {},
            ),
            Divider(
              thickness: 1,
              endIndent: 20.w,
              indent: 20.w,
            ),
            ListTile(
              title:
                  Row(children: [Icon(Icons.apps_sharp), Text('Categories')]),
            ),
            Divider(
              thickness: 1,
              endIndent: 20.w,
              indent: 20.w,
            ),
            ListTile(
              title: Row(children: [
                Icon(
                  Icons.logout_rounded,
                  color: Colors.red,
                ),
                Text(
                  'Log out',
                  style: TextStyle(color: Colors.redAccent),
                )
              ]),
              onTap: () {},
            ),
            Divider(
              thickness: 1,
              endIndent: 20.w,
              indent: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}
