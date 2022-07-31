// import 'dart:ffi';

// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:islamic_app/application/time/time_provider.dart';
import 'package:islamic_app/timetable.dart';
import 'constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool locationTake = false;
// bool azanAlarm = false;
bool iftarAlert = false;
bool sahriAlert = false;
bool azanAlert = false;

class Homepage extends HookConsumerWidget {
  List<TimeTable> azanTime = [
    TimeTable(
        azantitle: "Fazr",
        azantime: "04:28",
        azanicon: const Icon(CupertinoIcons.moon_zzz_fill)),
    TimeTable(
        azantitle: "Dhuhr",
        azantime: "13:28",
        azanicon: const Icon(CupertinoIcons.moon_zzz_fill)),
    TimeTable(
        azantitle: "Asr",
        azantime: "16:28",
        azanicon: const Icon(CupertinoIcons.moon_zzz_fill)),
    TimeTable(
        azantitle: "Magrib",
        azantime: "18:28",
        azanicon: const Icon(CupertinoIcons.moon_zzz_fill)),
    TimeTable(
        azantitle: "Isha",
        azantime: "20:28",
        azanicon: const Icon(CupertinoIcons.moon_zzz_fill)),
  ];

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(timeProvider);
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 300), () {
        ref.read(timeProvider.notifier).getTimes();
      });
      return null;
    }, []);

    return Scaffold(
      // backgroundColor: Colors.amber,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 60.h,
                        width: 20.w,
                      ),
                      Text(
                        "Ramadan \nMubarak",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                          fontSize: 45.sp,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'src/bg.png',
                    height: 185.h,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 116.h,
                width: 376.w,
                // alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(26.r))),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 22.w, right: 10.w, top: 20.h, bottom: 20.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: kPrimaryColor,
                                size: 28.h,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "Dhaka, Bangladesh",
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.thermostat,
                                color: kSubTitleColor,
                                size: 28.h,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "23'c Today",
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  color: kSubTitleColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 35.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Transform.scale(
                            scale: 0.8.w,
                            child: CupertinoSwitch(
                                value: locationTake,
                                onChanged: (bool value) {
                                  // setState(() {
                                  //   locationTake = value;
                                  // });
                                },
                                activeColor: kPrimaryColor),
                          )
                          // Icon(
                          //   Icons.toggle_on,
                          //   color: primaryClr,
                          //   size: 42.h,
                          // )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      if (state.timeData.length >= 2)
                        customWidget(
                            ktitle: 'Ifter Alert',
                            kheight: 203,
                            kwidth: 175,
                            iconx: const Icon(
                              CupertinoIcons.sun_dust_fill,
                              color: kPrimaryColor,
                            ),
                            ktime: state.timeData[1].timings.fazar,
                            ksubtitle: 'ksubtitle',
                            switchx: CupertinoSwitch(
                                value: state.iftarAlert,
                                onChanged: (bool value) {
                                  ref
                                      .read(timeProvider.notifier)
                                      .setIftarAlert(value);
                                  // setState(() {
                                  //   iftarAlert = value;
                                  // });
                                },
                                activeColor: kPrimaryColor)),
                      SizedBox(
                        height: 22.h,
                      ),
                      customWidget(
                          ktitle: 'Sahri Alert',
                          kheight: 203,
                          kwidth: 175,
                          iconx: const Icon(
                            CupertinoIcons.moon_stars_fill,
                            color: kPrimaryColor,
                          ),
                          ktime: '04:28',
                          ksubtitle: 'ksubtitle',
                          switchx: CupertinoSwitch(
                              value: sahriAlert,
                              onChanged: (bool value) {
                                // setState(() {
                                //   sahriAlert = value;
                                // });
                              },
                              activeColor: kPrimaryColor)),
                    ],
                  ),
                  customWidget(
                    kheight: 430,
                    kwidth: 180,
                    iconx: const Icon(
                      CupertinoIcons.speaker_2_fill,
                      color: kPrimaryColor,
                    ),
                    ktime: 'Azan',
                    ksubtitle: 'Azan Alert',
                    switchx: CupertinoSwitch(
                        value: azanAlert,
                        onChanged: (bool value) {
                          // setState(() {
                          //   azanAlert = value;
                          // });
                        },
                        activeColor: kPrimaryColor),
                    azantList: azanTime,
                    ktitle: 'Azan Alert',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // State<StatefulWidget> createState() {
  //   throw UnimplementedError();
  // }
}

// ignore: camel_case_types, must_be_immutable
class customWidget extends StatelessWidget {
  String? ktitle;
  final double kheight;
  final double kwidth;
  final Icon iconx;
  final CupertinoSwitch switchx;
  final String ktime;
  final String ksubtitle;
  List<TimeTable>? azantList;
  // listAzan(List<TimeTable?> azanList) {
  //   for (TimeTable? t in azanList) {
  //     Text(azanList),
  //   }
  // }

  // ignore: use_key_in_widget_constructors
  customWidget(
      {this.ktitle,
      this.azantList,
      required this.kheight,
      required this.kwidth,
      required this.iconx,
      required this.ktime,
      required this.ksubtitle,
      required this.switchx});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kheight.h,
      width: kwidth.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.r),
        color: kSecondaryColor,
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 15.w, right: 15.w, top: 12.h, bottom: 12.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.scale(scale: 1.3.w, child: iconx),
                  Transform.scale(scale: 0.8.w, child: switchx)
                ],
              ),
            ),
            // SizedBox(
            //   height: 20.h,
            // ),
            Text(
              ktime,
              style: TextStyle(
                fontSize: 45.sp,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            // SizedBox(
            //   height: 20.h,
            // ),
            if ((azantList ?? []).isNotEmpty)
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: azantList?.length,
                  itemBuilder: (context, index) {
                    final azan = azantList?[index];

                    if (azan != null) {
                      return SizedBox(
                        height: 35.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            azan.azanicon,
                            SizedBox(
                                width: 100.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${azan.azantitle}",
                                      style: const TextStyle(
                                          color: kSubTitleColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("${azan.azantime}",
                                        style: const TextStyle(
                                            color: kSubTitleColor,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ))
                          ],
                        ),
                      );
                    } else {
                      return const Text("value null");
                    }
                  }),
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  ktitle ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: kSubTitleColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
