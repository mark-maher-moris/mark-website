import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mark_website/consts.dart';
import 'package:mark_website/contact_widget.dart';
import 'package:mark_website/custom_drawer.dart';
import 'package:mark_website/glowing_btn.dart';
import 'package:mark_website/project_widget.dart';
import 'package:mark_website/projects_data.dart';
import 'package:mark_website/skils.dart';
import 'package:simple_grid/simple_grid.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mark_website/image_manager.dart';
import 'package:mark_website/strings_manager.dart';
import 'dart:html' as html;

class HomeLandingPage extends StatefulWidget {
  const HomeLandingPage({super.key});

  @override
  State<HomeLandingPage> createState() => _HomeLandingPageState();
}

class _HomeLandingPageState extends State<HomeLandingPage> {
  List<Color> colorizeColors = [
    const Color.fromARGB(255, 229, 84, 255),
    const Color.fromARGB(255, 96, 183, 255),
    const Color.fromARGB(255, 255, 239, 97),
    const Color.fromARGB(255, 255, 82, 69),
  ];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey projectsKey = GlobalKey();
  GlobalKey aboutMeKey = GlobalKey();
  GlobalKey contactKey = GlobalKey();

  scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: MediaQuery.of(context).size.width < 850
              ? Text(
                  "Mark Maher",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                )
              : Row(children: [
                  AnimatedHoverText(
                    title: "Projects",
                    onTap: () {
                      scrollToSection(projectsKey);
                    },
                  ),
                  AnimatedHoverText(
                    title: "About me",
                    onTap: () {
                      scrollToSection(aboutMeKey);
                    },
                  ),
                  AnimatedHoverText(
                    title: "Certificates",
                    onTap: () {
                      scrollToSection(projectsKey);
                    },
                  ),
                  AnimatedHoverText(
                    title: "Contact",
                    onTap: () {
                      scrollToSection(contactKey);
                    },
                  ),
                  Spacer(),
                  FlutterSocialButton(
                    iconSize: 17,
                    onTap: () {
                      openLink(Consts.facebookLink);
                    },
                    mini: true,
                    buttonType: ButtonType.facebook,
                  ),
                  FlutterSocialButton(
                    iconSize: 17,
                    onTap: () {
                      openLink(Consts.instagramLink);
                    },
                    mini: true,
                    buttonType: ButtonType.instagram,
                  ),
                  FlutterSocialButton(
                    iconColor: const Color.fromARGB(255, 68, 12, 64),
                    iconSize: 17,
                    onTap: () {
                      openLink(Consts.tiktokLink);
                    },
                    mini: true,
                    buttonType: ButtonType.tiktok,
                  ),
                  FlutterSocialButton(
                    iconSize: 17,
                    onTap: () {
                      openLink(Consts.linkedinLink);
                    },
                    mini: true,
                    buttonType: ButtonType.linkedin,
                  ),
                ]),

          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: glowingBtn(
                  title: "Contact",
                  onTap: () {
                    openLink(Consts.whatsappLink);
                  }),
            )
          ],
          leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(
                HugeIcons.strokeRoundedMenu02,
                color: Colors.white,
              )),
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: Text(
          //     'Mark Maher',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),

          automaticallyImplyLeading: true,
          leadingWidth: 100,
        ),
        drawer: customDrawer(),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 5,
                child: Image.asset(
                  ImageManager.background1,
                  fit: BoxFit.cover,
                ),
              ),
              // Expanded(
              //   child: Container(
              //     width: double.infinity,
              //     color: Colors.black.withOpacity(0.5),
              //   ),
              // ),
              Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Mark Maher",
                                        style: TextStyle(
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      AnimatedTextKit(
                                        repeatForever: true,
                                        animatedTexts: [
                                          ColorizeAnimatedText(
                                              'Enterpreneur - Software Engineer',
                                              colors: colorizeColors,
                                              textStyle: const TextStyle(
                                                  fontSize: 25,
                                                  color: const Color.fromARGB(
                                                      255, 255, 42, 42))),
                                          ColorizeAnimatedText(
                                              'Enterpreneur - Software Engineer',
                                              colors: colorizeColors,
                                              textStyle: const TextStyle(
                                                  fontSize: 25,
                                                  color: Color.fromARGB(
                                                      255, 57, 149, 255))),
                                        ],
                                      ),
                                      rowPoint(
                                          text:
                                              'Skilled Mobile App Developer with 2 years of experience'),
                                      rowPoint(
                                          text:
                                              'Strong problem-solving skilles'),
                                      rowPoint(
                                          text:
                                              'Experienced in translating business requirements into high-quality solutions.'),
                                      rowPoint(
                                          text: 'Strong communication skills'),
                                      rowPoint(
                                          text:
                                              'Enterpreneur with a passion for innovation'),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      glowingBtn(
                                          title: "Download CV", onTap: () {})
                                    ]),
                                glassContainer(
                                    isCircular: true,
                                    child: Container(
                                        height: 500,
                                        width: 500,
                                        child:
                                            Image.asset(ImageManager.myImage)))
                              ],
                            ),
                          ),
                          Container(
                            key: projectsKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 60,
                                ),
                                Text(
                                  "Projects",
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceEvenly,
                                //   children: [
                                //     for (int i = 0; i < myProjects.length; i++)
                                //       ProjectWidget(model: myProjects[i])
                                //   ],
                                // )

                                SpGrid(
                                    width: MediaQuery.of(context).size.width,
                                    children: [
                                      for (int i = 0;
                                          i < myProjects.length;
                                          i++)
                                        SpGridItem(
                                            xs: 12,
                                            sm: 6,
                                            md: 4,
                                            lg: 6,
                                            child: ProjectWidget(
                                                model: myProjects[i])),
                                    ])
                              ],
                            ),
                          ),
                          Container(
                              key: contactKey,
                              width: double.infinity,
                              constraints: BoxConstraints(maxWidth: 600),
                              margin: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.2),
                                border:
                                    Border.all(color: Colors.white, width: 4),
                              ),
                              child: Column(children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  StringsManager.contact,
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                contactMeWidget(
                                    icon: HugeIcons.strokeRoundedContact,
                                    value: StringsManager.phoneNumber,
                                    onTap: () {}),
                                SizedBox(
                                  height: 20,
                                ),
                                contactMeWidget(
                                    icon: Icons.email_outlined,
                                    value: StringsManager.email,
                                    onTap: () {}),
                                SizedBox(
                                  height: 20,
                                ),
                              ])),
                          Text(
                            StringsManager.about,
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                'I am living in cairo , Egypt ',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Bachelor of Computer science    --  EELU university ',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Soft Skills: Honesty - Fast Learner – Collaborative - Problem Solving - Strong Search Skills ',
                                style: TextStyle(color: Colors.white),
                              ),
                              Card(
                                child: Text(''),
                              ),
                              SkillsPage(),
                              languageContainer(
                                  language: StringsManager.english,
                                  level: 'B1'),
                              languageContainer(
                                  language: StringsManager.arabic, level: 'C2'),
                              languageContainer(
                                  language: StringsManager.german, level: 'A1'),
                            ],
                          ),
                        ],
                      ))),
            ],
          ),
        ));
  }
}

Widget languageContainer({String? language, String? level}) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
    height: 50,
    width: 200,
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.black, width: 2)),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Icon(Icons.circle_outlined),
      Text(
        language.toString(),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      Text(
        level.toString(),
        style: TextStyle(fontSize: 17),
      )
    ]),
  );
}

Widget glassContainer(
    {double? width, double? height, Widget? child, bool isCircular = false}) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: InkWell(
      onTap: () {},
      child: ClipOval(
        child: Container(
          child: Container(
            width: width,
            height: height,
            child: Center(
              child: child,
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color.fromARGB(255, 8, 112, 135),
                  const Color.fromARGB(255, 1, 26, 32),
                ]),
                shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
                //color: Colors.white.withOpacity(0.2),
                borderRadius: isCircular ? null : BorderRadius.circular(20),
                border:
                    Border.all(color: Colors.white.withOpacity(0.5), width: 4)),
          ),
        ),
      ),
    ),
  );
}

Widget rowPoint({String? text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      children: [
        Container(
          width: 5,
          height: 20,
          decoration:
              BoxDecoration(color: const Color.fromARGB(255, 255, 172, 28)),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          text!,
          style: TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}

class AnimatedHoverText extends StatefulWidget {
  AnimatedHoverText({super.key, required this.onTap, required this.title});
  final GestureTapCallback? onTap;
  final String title;

  @override
  State<AnimatedHoverText> createState() => _AnimatedHoverTextState();
}

class _AnimatedHoverTextState extends State<AnimatedHoverText> {
  Color containerColor = Colors.transparent;
  bool shadow = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          containerColor = const Color.fromARGB(255, 72, 243, 33)
              .withOpacity(0.4); // Change hover color
          shadow = true;
        });
      },
      onExit: (event) {
        setState(() {
          containerColor = Colors.transparent; // Reset color on exit
          shadow = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          decoration: BoxDecoration(
            boxShadow: [
              shadow
                  ? BoxShadow(
                      color: const Color.fromARGB(255, 97, 97, 97)
                          .withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                    )
                  : BoxShadow(
                      color: Colors.transparent,
                      spreadRadius: 5,
                      blurRadius: 7,
                    )
            ],
            color: containerColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

openLink(String link) {
  html.window.open(link, 'new tab');
}
