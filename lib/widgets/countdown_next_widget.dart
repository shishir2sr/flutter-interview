import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountdownNextWidget extends StatelessWidget {
  const CountdownNextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 12.h),
      width: 376.w,
      height: 141.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.r),
        color: kSecondaryColor,
      ),
      child: Row(
        children: [
          Text(
            'Next',
            style: kSubTitleOneStyle,
          ),
          const Spacer(),
          Column(
            children: [
              Icon(
                Icons.mosque,
                color: kPrimaryColor,
                size: 30.sp,
              ),
              Text(
                'Isha',
                style: kTitleStyle,
              ), //TODO: use appropriate variable
              Text(
                'In 3:50 Hrs', //TODO: use appropriate variable here
                style: kSubTitleTwoStyle,
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 30.w,
          )
        ],
      ),
    );
  }
}
