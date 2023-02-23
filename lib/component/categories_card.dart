import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesCard extends StatelessWidget {
  CategoriesCard({required this.name, this.color = Colors.grey});
  String name;
  var color;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        height: 220,
        decoration: BoxDecoration(color: color),
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
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Text(
                '${name}',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
