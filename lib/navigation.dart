import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:islamic_app/screens/azan_screen.dart';
import 'package:islamic_app/screens/compass.dart';
import 'package:islamic_app/screens/countdown_screen.dart';
// import 'application/time/time_provider.dart';
import 'hompage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

import 'constants.dart';

class NavigatorPage extends StatefulWidget {
  NavigatorPage({Key? key}) : super(key: key);

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int myIndex = 0;

  List<Widget> widgetList = [
    Homepage(),
    const CountdownScreen(),
    const AzanScreen(),
    const CompassScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(right: 26.w, left: 26.w, bottom: 10.h),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(25.r)),
          child: SizedBox(
            height: 65.h,
            child: BottomNavigationBar(
                onTap: (index) => {
                      setState(() {
                        myIndex = index;
                      }),
                    },
                currentIndex: myIndex,
                iconSize: 20,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: kSecondaryColor,
                unselectedItemColor: kSubTitleColor,
                elevation: 0,
                // fixedColor: kPrimaryColor,
                selectedItemColor: kPrimaryColor,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.house_fill,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.alarm_fill),
                      label: 'CountDown'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications), label: 'Azan'),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.compass_fill),
                      label: 'Compass'),
                ]),
          ),
        ),
      ),
      body: IndexedStack(
        children: widgetList,
        index: myIndex,
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
