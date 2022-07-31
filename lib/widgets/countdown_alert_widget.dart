import 'package:flutter/cupertino.dart';

import '../constants.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountdownAlertWidger extends StatefulWidget {
  const CountdownAlertWidger({Key? key}) : super(key: key);

  @override
  State<CountdownAlertWidger> createState() => _CountdownAlertWidgerState();
}

class _CountdownAlertWidgerState extends State<CountdownAlertWidger> {
  bool _value = true;
  @override
  Widget build(BuildContext context) {
    return // Figma Flutter Generator Rectangle6Widget - RECTANGLE
        Container(
      // padding: EdgeInsets.symmetric(
      //   horizontal: 27.w,
      // ),
      width: 376.w,
      height: 77.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.r),
        color: kSecondaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 5.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Iftar Alert',
              style: kSubTitleOneStyle,
            ),
            Transform.scale(
              scale: 0.6,
              child: CupertinoSwitch(
                activeColor: kPrimaryColor,
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
