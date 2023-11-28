import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:mybindel_test/pagerouter/customPageRouter.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/screens/BasePage.dart';

import 'package:mybindel_test/screens/create_userPage.dart';
import 'package:mybindel_test/providers/selectTheme.dart';
import 'package:mybindel_test/screens/loginPage.dart';
import 'package:mybindel_test/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final theme = Themeprovider();
  await theme.getTheme();
  print("called already");

  runApp(
      Sizer(builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider(
          create: (context) => Themeprovider(),
          child: MyApp(),
        );
      })
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    print("Materialapp : ${provider.currentTheme}");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: provider.currentTheme
          ? ThemeMode.light
          : ThemeMode.dark, //ThemeMode.system, //
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: splash(),
      //home: BasePage(),
      //home: CreateUser(),
    );
  }
}



class splash extends StatefulWidget {
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2500), () {
      openscreen();
    });
  }

  openscreen() {
    Navigator.pushReplacement(
        this.context, custompageroute(child: login_page()));
  }

  // @override
  // void initState() {
  //   super.initState();
  //   startTime();
  // }
  //
  // startTime() async {
  //   await Future.delayed(Duration(milliseconds: 2500),(){});
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login_page()));
  // }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    // final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return Scaffold(
        body: Stack(
          children: [
            Container(
              width: (100).w,
              height: (100).h,
              decoration: BoxDecoration(
                color: provider.currentTheme ? orange_color : dark_Scaffold_color,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: (25.8).w,
                height: (14.9).h,
                // color: Colors.amber,
                child: provider.currentTheme
                    ? Image.asset('asset/images/splashlogo.png')
                    : Image.asset('asset/images/dark_splashlogo.png'),
              ),
            ),
            Positioned(
              bottom: (7.00).h,
              right: (100).w / 2 - (40.3).w / 2,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                width: (40.3).w,
                height: (6.80).h,
                //  color: Colors.amber,
                child: Text("Mybindle",
                    style: provider.currentTheme
                        ? const TextStyle(
                        color: Color.fromRGBO(242,242,242,1) ,
                        // fontFamily: 'Avant',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                        fontSize: 21)
                        : TextStyle(
                      // fontFamily: 'Avant',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      fontSize: 21,
                      color: orange_color,
                    )),
              ),
            ),
          ],
        ));
  }
}
