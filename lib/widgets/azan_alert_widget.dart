import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class AzanAlertWidget extends StatefulWidget {
  const AzanAlertWidget({Key? key}) : super(key: key);

  @override
  State<AzanAlertWidget> createState() => _AzanAlertWidgetState();
}

class _AzanAlertWidgetState extends State<AzanAlertWidget> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 395.w,
      height: 600.h,
      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 15.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.r), color: kSecondaryColor),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  _value ? CupertinoIcons.volume_up : CupertinoIcons.volume_off,
                  size: 40.sp,
                  color: _value ? kPrimaryColor : kSubTitleColor,
                ),
                Transform.scale(
                  scale: 0.7,
                  child: IconButton(
                    iconSize: 40.sp,
                    onPressed: () {},
                    icon: CupertinoSwitch(
                      activeColor: kPrimaryColor,
                      value: _value,
                      onChanged: (value) {
                        setState(
                          () {
                            _value = value;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              'Azan',
              style: kTitleStyle,
            ),
          ),
          Expanded(
            child: azanAlertItems(
                azan: 'Fazr', azanTime: '04:50', isChecked: true),
          ),
          Expanded(
            child: azanAlertItems(
                azan: 'Duhr', azanTime: '01:30', isChecked: true),
          ),
          Expanded(
            child:
                azanAlertItems(azan: 'Asr', azanTime: '05:50', isChecked: true),
          ),
          Expanded(
            child: azanAlertItems(
                azan: 'Magrib', azanTime: '06:30', isChecked: false),
          ),
          Expanded(
            child: azanAlertItems(
                azan: 'Isha', azanTime: '08:30', isChecked: true),
          ),
          Expanded(
              child: TextButton(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: kBackgroundColor),
              height: 50.h,
              width: 200.w,
              child: Center(
                child: Text(
                  'Set',
                  style: kSubTitleStyle,
                ),
              ),
            ),
            onPressed: () {},
          ))
        ],
      ),
    );
  }

  Row azanAlertItems(
      {required String azan,
      required String azanTime,
      required bool isChecked}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            azan,
            style: kSubTitleOneStyle,
          ),
        ),
        Expanded(
          child: Text(
            azanTime,
            style: kSubTitleOneStyle,
          ),
        ),
        Container(
          child: Checkbox(
              splashRadius: 30.r,
              activeColor: kPrimaryColor,
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                  print(isChecked);
                });
              },
              shape: const CircleBorder(),
              materialTapTargetSize: MaterialTapTargetSize.padded),
        )
      ],
    );
  }
}
