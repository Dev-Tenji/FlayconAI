import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flayconai_v2/About.dart';
import 'package:flayconai_v2/Applogic.dart';
import 'package:flayconai_v2/CreateModel.dart';
import 'package:flayconai_v2/HomeScreen.dart';
import 'package:flayconai_v2/ImgGen.dart';
import 'package:flayconai_v2/Settings.dart';
//import 'package:flayconai_v2/usermodel.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: const Color.fromARGB(255, 204, 187, 187),
      width: 250,
      backgroundColor: Applogic().appColor,
      child: ColorfulSafeArea(
        color: Applogic().appColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 200, //200
                  width: 200,
                )
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Applogic().WriteText2('home'),
              onTap: () {
                var route = MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                );
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage("assets/threeStars.png"),
                color: Colors.white,
              ),
              title: Applogic().WriteText2('AI model'),
              onTap: () {
                var route = MaterialPageRoute(
                  builder: (context) => const CreatModel(),
                );
                Navigator.push(context, route);
              },
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.image_search,
            //     color: Colors.white,
            //   ),
            //   title: Applogic().WriteText2('Answer Image'),
            //   onTap: () => null,
            // ),
            ListTile(
              leading: Icon(
                Icons.image_rounded,
                color: Colors.white,
              ),
              title: Applogic().WriteText2('Image generator'),
              onTap: () {
                var route = MaterialPageRoute(
                  builder: (context) => const ImagGen(),
                );
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Applogic().WriteText2('Settings'),
              onTap: () {
                var route = MaterialPageRoute(
                  builder: (context) => const Settings(),
                );
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.white,
              ),
              title: Applogic().WriteText2('About'),
              onTap: () {
                var route = MaterialPageRoute(
                  builder: (context) => const About(),
                );
                Navigator.push(context, route);
              },
            ),
            SizedBox(
              height: 270,
            ),
            Applogic().WriteText2('  V.1.0')
          ],
        ),
      ),
    );
  }
}
