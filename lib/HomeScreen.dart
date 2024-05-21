import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flayconai_v2/Applogic.dart';
import 'package:flayconai_v2/NavBar.dart';
import 'package:flutter/material.dart';

//import 'package:groq/groq.dart';
import 'package:speech_to_text_google_dialog/speech_to_text_google_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final groq = Groq(
  //     const String.fromEnvironment(
  //         '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'),
  //     model: GroqModel.llama38b8192);

  String voiceText = '';

  final query = TextEditingController();
  var authkey = GlobalKey<FormState>();
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
              color: Colors.black,
              width: 10,
              height: 100,
              child: Column(
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Welcome! to HuggerFace AI',
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: Applogic().appfont,
                              fontSize: 20)),
                    ],
                    repeatForever: false,
                    totalRepeatCount: 1,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                          '      this is a flutter project made by DevTenji \n and by default this chat bot uses Meta llama3 70B',
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: Applogic().appfont))
                    ],
                    repeatForever: false,
                    totalRepeatCount: 1,
                  ),
                ],
              ),
            ),
           SizedBox(
               height: 479,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      width: 250,
                      height: 50,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            voiceText = value;
                          });
                        },
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: Applogic().appfont),
                        controller: query,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                var result = Applogic().defaultAI(voiceText);
                                print(result);
                              },
                              icon: Icon(Icons.send),
                            ),
                            suffixIconColor: Colors.white,
                            filled: true,
                            fillColor: Applogic().appColor,
                            hintText: 'Ask a question....',
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
                      onPressed: () async {
                        bool hasGoogleSpeech =
                            await SpeechToTextGoogleDialog.getInstance()
                                .showGoogleDialog(onTextReceived: (data) {
                          setState(() {
                            voiceText = data.toString();
                            var result = Applogic().defaultAI(voiceText);
                            print(result);
                          });
                        });
                        if (!hasGoogleSpeech) {
                          // Applogic().PopNotify(
                          //     context,
                          //     'sorry google speech not supported',
                          //     Colors.white,
                          //     20);
                        }
                      },
                      child: Icon(
                        Icons.mic,
                        color: Colors.white,
                      ),
                    ),
                    // FloatingActionButton(
                    //   shape: CircleBorder(),
                    //   backgroundColor: Colors.deepPurple,
                    //   onPressed: () => null,
                    //   child: Icon(
                    //     Icons.image,
                    //     color: Colors.white,
                    //   ),
                    // ),
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
