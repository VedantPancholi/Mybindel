import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mybindel_test/screens/loginPage.dart';

import 'package:mybindel_test/widgets/payment_option_widget.dart';
import 'package:provider/provider.dart';

import '../pagerouter/customPageRouter.dart';
import '../palette/palette.dart';
import '../providers/selectTheme.dart';
import '../widgets/fieldbutton_widget.dart';


class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {

  // Future<bool?> getCurrentThemeInstance() async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getBool('currentTheme');
  // }
  int selectedindex = 0;


  @override
  Widget build(BuildContext context) {
    // final current_theme = getCurrentThemeInstance();

    final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final provider = Provider.of<Themeprovider>(context);
    final size = MediaQuery.of(context).size;
    final List<Map<String ,dynamic>> item = [
      {'image': 'asset/payment_icons/PayPal.png','title':'PayPal',},
      {'image': 'asset/payment_icons/bankTransfer.png','title':'Bank Transfer'},
      {'image': 'asset/payment_icons/masterCard.png','title':'Mastercard',},
      {'image': 'asset/payment_icons/americanExpress.png','title':'American Express',},
      provider.currentTheme?{'image': 'asset/payment_icons/applePay.png','title':'Apple Pay',}:{'image': 'asset/payment_icons/dark_applepay_theme.png','title':'Apple Pay',},
      {'image': 'asset/payment_icons/googlepay.png','title':'Google Pay',},
      provider.currentTheme?{'image': 'asset/payment_icons/amazonpay.png','title':'Amazon Pay',}:{'image': 'asset/payment_icons/dark_amazonpay_theme_according.png','title':'Amazon Pay',},
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: size.height * 0.15,
            width: size.width,
            color:  provider.currentTheme
                ? light_Scaffold_color
                : dark_Scaffold_color,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  height: size.height * 0.04,
                  width: size.width * 0.076,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/images/logo.png')))),
              SizedBox(width: size.width * 0.010),
              Container(
                height: size.height * 0.04,
                width: size.width * 0.27,
                alignment: Alignment.center,
                decoration: BoxDecoration(),
                child: Text(
                  "Mybindle",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      letterSpacing: 1.5),
                ),
              ),
            ]),
          ),
          Container(
            height: size.height * 0.85,
            width: size.width,
            color:  provider.currentTheme? light_Scaffold_color:dark_Scaffold_color,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.087,),
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.010,),
                  height: size.height * 0.030,
                  width: size.width,
                  // color: Colors.green,
                  child: const Text(
                    "Payment Methods",
                    style: TextStyle(
                        fontFamily: 'Avant',
                        fontSize: 21,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  height: size.height*0.65,
                  width: size.width,
                  child: ListView.builder(

                    //  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: item.length,
                    itemBuilder: (ctx , index){
                      return  paymentoption(
                        title: item[index]['title'],
                        image: item[index]['image'],
                        selecteditem: selectedindex == index ? true: false,
                        onpressed: () {
                          setState(() {
                            selectedindex = index ;
                          });

                          print(index);
                        },
                        margin: EdgeInsets.symmetric(
                            vertical: size.height * 0.010, horizontal: size.width * 0.087),
                        iconHeight: size.height * 0.07,
                        iconWidth: size.width * 0.14,
                        width: size.width * 0.60,
                      );
                    } ,

                  ),
                ),

                Container(
                    height: size.height*0.15,
                    // color: Colors.blue,//margin: EdgeInsets.fromLTRB(0,0,0,size.height*0.050),
                    child: Center(
                      child: fieldbutton(
                          title: "Continue",
                          padding:EdgeInsets.symmetric(
                              vertical: size.height * 0.010,
                              horizontal: size.width * 0.010),
                          height: size.height * 0.075,
                          width: size.width * 0.82,
                          onpressed: () {
                            Navigator.pushReplacement(context, custompageroute(child: login_page()));
                            print("Continue tapped");
                          }),
                    )

                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}