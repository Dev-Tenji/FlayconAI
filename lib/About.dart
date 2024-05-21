import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flayconai_v2/Applogic.dart';
import 'package:flayconai_v2/NavBar.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: const Color.fromARGB(255, 20, 20, 20),
                width: 200,
                child: Applogic().WriteText3(
                    """ Welcome to Huggerface AI, a simple Flutter project built by Devtenji (that's me!) as a fun experiment with AI models.
            
            Huggerface AI is a hobby project that allows users to communicate with AI models on Hugging Face using their API key. I built this app to explore the possibilities of AI and natural language processing, and to learn more about the Hugging Face API.
            
            As a developer, I'm passionate about learning and experimenting with new technologies, and Huggerface AI is one of my side projects. I'm not a professional developer, but I love to tinker with code and create something new in my free time.
            
            With Huggerface AI, you can interact with AI models on Hugging Face using your own API key. It's a simple app, but I hope you find it useful and interesting. I'm always learning and improving, so if you have any feedback or suggestions, feel free to reach out! --FYI this is AI generated""",
                    Colors.white54),
              ),
            )
          ],
        ),
      ),
    );
  }
}
