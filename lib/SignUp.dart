import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flayconai_v2/Applogic.dart';
import 'package:flayconai_v2/HomeScreen.dart';
import 'package:flayconai_v2/usermodel.dart';
//import 'package:flayconai_v2/sql/apiHelper.dart';
//import 'package:flayconai_v2/sql/apikey.dart';
//import 'package:flayconai_v2/SayHi.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final apikey = TextEditingController();
  var authkey = GlobalKey<FormState>();
   String ApiKey = "";

  @override
  void initState() {
    ApiKey = User.getApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ColorfulSafeArea(
        color: Applogic().appColor,
        child: Container(
          color: Applogic().appColor,
          child: Center(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ClipOval(
                      child: Image.asset(
                        'assets/logo.png',
                        height: 300,
                        width: 300,
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        setState(() {
                          ApiKey = value;
                        });
                      },
                      controller: apikey,
                      decoration: InputDecoration(
                          hintText: 'Enter Hugging Face Api',
                          hintStyle: TextStyle(
                            color: Colors.white54,
                            fontFamily: Applogic().appfont,
                          ),
                          filled: true,
                          fillColor: Colors.black,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Please enter your hugging face api';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                    ),
                    MaterialButton(
                      onPressed: () async {
                        try {
                          await User.SetApi(ApiKey);
                          var route = MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          );
                          Navigator.push(context, route);
                        } catch (e) {
                          print(e);
                        }
                      },
                      color: ApiKey == '' ? Colors.black87 : Colors.deepPurple,
                      child: ApiKey == ''
                          ? Applogic().WriteText3('continue', Colors.white54)
                          : Applogic().WriteText3('continue', Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
