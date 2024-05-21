import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flayconai_v2/Applogic.dart';
import 'package:flayconai_v2/HomeScreen.dart';
import 'package:flayconai_v2/sql/apiHelper.dart';
import 'package:flayconai_v2/sql/apikey.dart';
import 'package:flayconai_v2/usermodel.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  // late ApiDBHelper apis;
  // late Future<List<HuggerModel>> todo;
  // Future<String>GetApiKey() async{
  //     apis = ApiDBHelper();
  //     todo = apis.creatApi(api)
  // }
  String api = User.getApi();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      var route = MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
      Navigator.push(context, route);

      // Applogic().CheckUsername(api, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        color: Applogic().appColor,
        child: Container(
          color: Applogic().appColor,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 170,
                ),
                ClipOval(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 320, //320
                    width: 3200,
                  ),
                ),
                SizedBox(
                  height: 130, //130
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80, //110
                    ),
                    Applogic().WriteText('HuggerFace AI', 30),
                    SizedBox(
                      width: 2,
                    ),
                    Image.asset(
                      'assets/threeStars.png',
                      height: 20,
                      width: 20,
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 130,
                    ),
                    Applogic().WriteText('by Devtenji', 20)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
