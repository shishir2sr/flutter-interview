import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import '../widgets/countdown_alert_widget.dart';
import '../widgets/countdown_next_widget.dart';
import '../widgets/countdown_timer_widget.dart';

class CountdownScreen extends StatelessWidget {
  const CountdownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Countdown',
              style: kSubTitleStyle,
            ),
            SizedBox(height: 30.h),
            const CountdownTimer(),
            SizedBox(height: 30.h),
            const CountdownNextWidget(),
            SizedBox(
              height: 30.h,
            ),
            const CountdownAlertWidger(),
          ],
        ),
      ),
    );
  }
}
