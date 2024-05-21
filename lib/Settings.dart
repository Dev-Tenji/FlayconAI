import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flayconai_v2/Applogic.dart';
import 'package:flayconai_v2/NavBar.dart';
import 'package:flayconai_v2/usermodel.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String ApiKey = '';
  @override
  void initState() {
    ApiKey = User.getApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      backgroundColor: Applogic().appColor,
      appBar: AppBar(
        backgroundColor: Applogic().appColor,
        centerTitle: true,
        title: Row(
          children: [
            SizedBox(
              width: 40,
            ),
            Applogic().WriteText2('HuggerFace AI'),
            Image.asset(
              'assets/threeStars.png',
              height: 20,
              width: 20,
            ),
          ],
        ),
      ),
      body: ColorfulSafeArea(
        color: Applogic().appColor,
        child: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 0.5,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Applogic().WriteText('Change Api key', 20),
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                height: 60,
                width: 300,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  // initialValue: ApiKey,
                  onChanged: (value) {
                    setState(() {
                      ApiKey = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter api key',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 170, 162, 162)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 110, right: 110),
              child: MaterialButton(
                shape: StadiumBorder(),
                onPressed: () {
                  User.SetApi(ApiKey);
                },
                child: Applogic().WriteText2('Save changes'),
                color: Applogic().appColor3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
