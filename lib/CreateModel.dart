import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flayconai_v2/Applogic.dart';
import 'package:flayconai_v2/NavBar.dart';
import 'package:flutter/material.dart';

class CreatModel extends StatefulWidget {
  const CreatModel({super.key});

  @override
  State<CreatModel> createState() => _CreatModelState();
}

class _CreatModelState extends State<CreatModel> {
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
              height: 18,
            ),
            Center(
              child: Column(
                children: [
                  Card(
                    color: Colors.black,
                    elevation: 8.0,
                    child: Container(
                      color: Color.fromARGB(255, 27, 27, 27),
                      height: 50,
                      width: 300,
                      child: ListTile(
                        leading: Icon(
                          Icons.book,
                          color: Colors.red,
                        ),
                        title: Applogic().WriteText2('Text generation'),
                        onTap: () => null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 8.0,
                    child: Container(
                      color: Color.fromARGB(255, 27, 27, 27),
                      height: 50,
                      width: 300,
                      child: ListTile(
                        leading: Icon(
                          Icons.masks,
                          color: Colors.green,
                        ),
                        title: Applogic().WriteText2('Fill mask'),
                        onTap: () => null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 8.0,
                    child: Container(
                      color: Color.fromARGB(255, 27, 27, 27),
                      height: 50,
                      width: 300,
                      child: ListTile(
                        leading: Icon(
                          Icons.summarize,
                          color: Colors.orange,
                        ),
                        title: Applogic().WriteText2('Text summarization'),
                        onTap: () => null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 8.0,
                    child: Container(
                      color: Color.fromARGB(255, 27, 27, 27),
                      height: 50,
                      width: 300,
                      child: ListTile(
                        leading: Icon(
                          Icons.question_answer,
                          color: Colors.blue,
                        ),
                        title: Applogic().WriteText2('Question answering'),
                        onTap: () => null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 8.0,
                    child: Container(
                      color: Color.fromARGB(255, 27, 27, 27),
                      height: 50,
                      width: 300,
                      child: ListTile(
                        leading: Icon(
                          Icons.text_fields,
                          color: Colors.red,
                        ),
                        title: Applogic().WriteText2('Text classification'),
                        onTap: () => null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 8.0,
                    child: Container(
                      color: Color.fromARGB(255, 27, 27, 27),
                      height: 50,
                      width: 300,
                      child: ListTile(
                        leading: Icon(
                          Icons.token,
                          color: Colors.green,
                        ),
                        title: Applogic().WriteText2('Token classification'),
                        onTap: () => null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 8.0,
                    child: Container(
                      color: Color.fromARGB(255, 27, 27, 27),
                      height: 50,
                      width: 300,
                      child: ListTile(
                        leading: Icon(
                          Icons.language,
                          color: Colors.orange,
                        ),
                        title: Applogic().WriteText2('Translation'),
                        onTap: () => null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 8.0,
                    child: Container(
                      color: Color.fromARGB(255, 27, 27, 27),
                      height: 50,
                      width: 300,
                      child: ListTile(
                        leading: Icon(
                          Icons.check_box,
                          color: Colors.blue,
                        ),
                        title:
                            Applogic().WriteText2('Zero shot classifiaction'),
                        onTap: () => null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 8.0,
                    child: Container(
                      color: Color.fromARGB(255, 27, 27, 27),
                      height: 50,
                      width: 300,
                      child: ListTile(
                        leading: Icon(
                          Icons.people,
                          color: Colors.red,
                        ),
                        title: Applogic().WriteText2('conversational'),
                        onTap: () => null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 8.0,
                    child: Container(
                      color: Color.fromARGB(255, 27, 27, 27),
                      height: 50,
                      width: 300,
                      child: ListTile(
                        leading: Icon(
                          Icons.text_snippet_rounded,
                          color: Colors.green,
                        ),
                        title: Applogic().WriteText2('Sentence similarity'),
                        onTap: () => null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
