import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:mybindel_test/pagerouter/customPageRouter.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/screens/create_userPage.dart';
import 'package:mybindel_test/screens/loginPage.dart';
// import 'package:mybindel_test/screens/loginPage.dart';
import 'package:mybindel_test/screens/payement_methodsPage.dart';
import 'package:mybindel_test/screens/second_create_userPage.dart';
import 'package:mybindel_test/screens/welcomePage.dart';
import 'package:mybindel_test/theme/selectTheme.dart';
// import 'package:mybindel_test/screens/welcomePage.dart';
import 'package:mybindel_test/theme/theme.dart';
import 'package:provider/provider.dart';

// import 'package:test_mybindel/pageroute/customPageRouter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final theme = Themeprovider();
  await theme.getTheme();
  print("called already");


  runApp(
      ChangeNotifierProvider(
        create: (context) => Themeprovider(),
        builder: (context , child){

          final provider = Provider.of<Themeprovider>(context);
          print("Materialapp : ${provider.currentTheme}");
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: provider.currentTheme ? ThemeMode.light: ThemeMode.dark, //ThemeMode.system, //
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: CreateUser(),
          );
        },
      ));

  // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //   try {
  //     if (Platform.isAndroid) {
  //       await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //     }
  //   } catch (e) {}
  // });
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
        this.context, custompageroute(child: CreateUser()));
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color:
                provider.currentTheme ? orange_color : dark_Scaffold_color,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: size.width * 0.258,
            height: size.height * 0.149,
            // color: Colors.amber,
            child: provider.currentTheme
                ? Image.asset('asset/images/splashlogo.png')
                : Image.asset('asset/images/dark_splashlogo.png'),
          ),
        ),
        Positioned(
          bottom: size.height * 0.07,
          right: size.width / 2 - size.width * 0.403 / 2,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            width: size.width * 0.403,
            height: size.height * 0.068,
            //  color: Colors.amber,
            child: Text("Mybindle",
                style: provider.currentTheme
                    ? TextStyle(
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
