import 'package:clean_api/clean_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:islamic_app/constants.dart';
import 'package:islamic_app/hompage.dart';
import 'package:islamic_app/navigation.dart';
import 'package:islamic_app/screens/azan_screen.dart';
import 'package:islamic_app/screens/countdown_screen.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  CleanApi.instance().setup(baseUrl: 'http://api.aladhan.com/v1/');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'Lato', scaffoldBackgroundColor: kBackgroundColor
            // primaryColor: const Color(0x00486548),
            ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: NavigatorPage(),
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
