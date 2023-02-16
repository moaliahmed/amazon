import 'package:amazon/component/botton_component.dart';
import 'package:amazon/screens/login_screan.dart';
import 'package:amazon/src/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnBordingScrean extends StatefulWidget {
  @override
  _OnBordingScreanState createState() => _OnBordingScreanState();
}

class _OnBordingScreanState extends State<OnBordingScrean> {
  late PageController _pageController;
  int currentIndex = 0;

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  previousFunction() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: onChangedFunction,
            children: <Widget>[
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/app_icon/onboarding1.png'),
                  SizedBox(
                    height: 150,
                  ),
                  Center(
                      child: Text(
                    '     Browse the menu \n and order directly form\n        the application',
                    style: TextStyle(fontSize: 22),
                  ))
                ],
              )),
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/app_icon/onboarding2.png'),
                  SizedBox(
                    height: 150,
                  ),
                  Center(
                      child: Text(
                    '       your older will be \n immediately collected and \n       send be our courier',
                    style: TextStyle(fontSize: 22),
                  ))
                ],
              )),
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/app_icon/onboarding3.png'),
                  SizedBox(
                    height: 150,
                  ),
                  Center(
                      child: Text(
                    '      Pick up delivery  \n at your door and enjoy\n           groceries',
                    style: TextStyle(fontSize: 22),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Button(
                    name: 'Get start',
                    function: () {
                      AppNavigator.appNavigator(context, true, LoginScrean());
                    },
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              )),
            ],
          ),
          Positioned(
            bottom: 60,
            left: 150,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Indicator(
                  positionIndex: 0,
                  currentIndex: currentIndex,
                ),
                SizedBox(
                  width: 10,
                ),
                Indicator(
                  positionIndex: 1,
                  currentIndex: currentIndex,
                ),
                SizedBox(
                  width: 10,
                ),
                Indicator(
                  positionIndex: 2,
                  currentIndex: currentIndex,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  Indicator({required this.currentIndex, required this.positionIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          color:
              positionIndex == currentIndex ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
