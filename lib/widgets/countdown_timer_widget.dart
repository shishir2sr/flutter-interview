import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // This Tween Animation Builder is Just For Demonstration, Do not use this AS-IS in Projects
      // Create and Animation Controller and Control the animation that way.
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(seconds: 4),
        builder: (context, value, child) {
          int percentage = (double.parse(value.toString()) * 59).ceil();
          // ignore: sized_box_for_whitespace
          return Container(
            width: kcountdownTimerSize.w,
            height: kcountdownTimerSize.w,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: kSecondaryColor),
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return SweepGradient(
                            //Starting to ending
                            startAngle: 0.0,
                            endAngle: ktwoPi,
                            stops: [
                              double.parse(value.toString()),
                              double.parse(value.toString())
                            ],
                            // 0.0 , 0.5 , 0.5 , 1.0
                            center: Alignment.center,
                            colors: const [kPrimaryColor, kSecondaryColor])
                        .createShader(rect);
                  },
                  child: Container(
                    width: kcountdownTimerSize.w,
                    height: kcountdownTimerSize.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: FittedBox(
                        child: Image.asset('assets/images/radial_scale1.png',
                            fit: BoxFit.fill)),
                  ),
                ),

                //Inner Circle
                Center(
                  child: Container(
                    width: (kcountdownTimerSize - 100).w,
                    height: (kcountdownTimerSize - 100).w,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.sunset_fill,
                            color: kPrimaryColor,
                            size: 52
                                .sp), //TODO: use countdowntimericon.svg file from assets/icons

                        Text(
                          "12:$percentage",
                          //TODO: Implement Countdown for alerm system
                          style: kTitleStyle,
                        ),
                        Text(
                          'Mins Remaining',
                          style: kSubTitleTwoStyle,
                        ),
                        Text(
                          'for Iftar',
                          style: kSubTitleTwoStyle,
                        ) //TODO: Replace iftar with aprropriate variael
                      ],
                    )),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
