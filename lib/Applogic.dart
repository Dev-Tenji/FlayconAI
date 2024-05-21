import 'dart:typed_data';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:brain_fusion/brain_fusion.dart';

import 'package:flayconai_v2/HomeScreen.dart';

import 'package:flayconai_v2/SignUp.dart';
import 'package:flayconai_v2/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gal/gal.dart';
import 'package:huggingface_dart/huggingface_dart.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class Applogic {
  Color appColor = Color.fromARGB(255, 12, 11, 11);

  Color appColor2 = Colors.white;
  Color appColor3 = const Color.fromARGB(
      255, 103, 58, 183); //Color.fromARGB(255, 25, 117, 223);
  Widget WriteText(String anything, double Fsize) {
    return Text(
      anything,
      style: TextStyle(
          fontFamily: Applogic().appfont,
          fontSize: Fsize,
          color: Applogic().appColor2),
    );
  }

  Widget WriteText2(String anything) {
    return Text(
      anything,
      style: TextStyle(
          fontFamily: Applogic().appfont, color: Applogic().appColor2),
    );
  }

  Widget WriteText3(String anything, Color jet) {
    return Text(
      anything,
      style: TextStyle(fontFamily: Applogic().appfont, color: jet),
    );
  }

  Widget WriteText4(String anything, Color jet, double Fsize) {
    return Text(
      anything,
      style: TextStyle(
          fontFamily: Applogic().appfont, color: jet, fontSize: Fsize),
    );
  }

  String appfont = 'Roboto';

  CheckUsername(String ApiKey, BuildContext context) {
    if (ApiKey == "") {
      var route = MaterialPageRoute(
        builder: (context) => SignUp(),
      );
      Navigator.push(context, route);
    } else {
      var route = MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
      Navigator.push(context, route);
    }
  }

  PopNotify(
    BuildContext context,
    String anything,
  ) {
    return ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
      padding: EdgeInsets.all(20),
      content: WriteText2(anything),
      elevation: 5,
      backgroundColor: appColor,
      actions: [
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
        )
      ],
    ));
  }

  Widget AIanswer(String jet) {
    return Container(
      color: const Color.fromARGB(255, 19, 18, 18),
      width: double.infinity,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(jet,
                  textStyle: TextStyle(
                    color: Colors.white,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  final AI ai = AI();
  AIStyle aiStyle = AIStyle.anime;
  Future<Uint8List> generate(String query) async {
    Uint8List image = await ai.runAI(query, AIStyle.anime, Resolution.r9x16);
    return image;
  }

  Widget ImageGenerate( String Img, Uint8List res) {
    return FutureBuilder<Uint8List>(
      // Call the generate() function to get the image data
      future: generate(Img),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the image data, display a loading indicator
          return const CircularProgressIndicator(
            color: Colors.deepPurple,
          );
        } else if (snapshot.hasError) {
          // If an error occurred while getting the image data, display an error
          return WriteText2('sorry an error ocurred');
        } else if (snapshot.hasData) {
          res = snapshot.data!;
          return Image.memory(
            snapshot.data!,
            fit: BoxFit.cover,
          );
        } else {
          // If no data is available, display a placeholder or an empty container
          return PopNotify(context, 'No data available please try again later');
        }
      },
    );
  }

  SaveImg(Uint8List uint8list, BuildContext context) async {
    try {
      await Gal.putImageBytes(uint8list, album: 'HuggerFace AI');
      PopNotify(context, 'saved');
    } on GalException catch (e) {
      PopNotify(context, '${e.type.message}');
    }
  }

  defaultAI(String query) {
    String Api = User.getApi();
    HfInference hfInference = HfInference(Api);
    var response = hfInference
        .textGeneration(inputs: [query], model: "meta-llama/Meta-Llama-3-70B");
    return response;
  }

  Widget getImage(bool tt,  String Img, Uint8List res) {
    if (tt == false) {
      return Center(
        child: Row(
          children: [
            SizedBox(
              width: 100,
            ),
            Applogic().WriteText3(
                'Generate image below', const Color.fromRGBO(224, 224, 224, 1)),
            Icon(
              Icons.image,
              color: const Color.fromRGBO(224, 224, 224, 1),
            )
          ],
        ),
      );
    } else {
      return InstaImageViewer(
        child: Applogic().ImageGenerate( Img, res),
      );
    }
  }
}
