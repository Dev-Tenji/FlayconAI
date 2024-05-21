import 'dart:typed_data';

import 'package:brain_fusion/brain_fusion.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flayconai_v2/Applogic.dart';
import 'package:flayconai_v2/NavBar.dart';
import 'package:flutter/material.dart';
//import 'package:insta_image_viewer/insta_image_viewer.dart';

class ImagGen extends StatefulWidget {
  const ImagGen({super.key});

  @override
  State<ImagGen> createState() => _ImagGenState();
}

class _ImagGenState extends State<ImagGen> {
  final overlay = OverlayPortalController();
  Uint8List res = Uint8List(8);
  String Img = '';
  bool isLoading = false;

  final AI ai = AI();
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
            Container(
              height: 200,
              width: double.infinity,
              color: Color.fromARGB(255, 20, 20, 20),
              child: Applogic().getImage(isLoading, Img, res),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: MaterialButton(
                color: Applogic().appColor3,
                onPressed: () {
                  setState(() {
                    isLoading = false;
                  });
                  Applogic().SaveImg(res, context);
                },
                child: Applogic().WriteText2('Download'),
              ),
            ),
            SizedBox(
              height: 310,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      width: 250,
                      height: 70,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            Img = value;
                          });
                        },
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: Applogic().appfont),

                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                              },
                              icon: Icon(Icons.send),
                            ),
                            suffixIconColor: Colors.white,
                            filled: true,
                            fillColor: Applogic().appColor,
                            hintText: 'Generate your image....',
                            hintStyle: TextStyle(
                              color: Colors.white54,
                              fontFamily: Applogic().appfont,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'please provide a query';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      shape: CircleBorder(),
                      backgroundColor: Applogic().appColor3,
                      onPressed: () {},
                      child: PopupMenuButton(
                        itemBuilder: (context) => [],
                        child: Icon(
                          Icons.style,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
