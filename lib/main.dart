import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mark_website/fonts.dart';
import 'package:mark_website/image_manager.dart';
import 'package:mark_website/project_model.dart';
import 'package:mark_website/projects_data.dart';
import 'package:mark_website/rotes.dart';
import 'package:mark_website/website_strings.dart';
import 'package:mouse_follower/mouse_follower.dart';
import 'firebase_options.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:animate_do/animate_do.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MouseFollower(
      onHoverMouseCursor: SystemMouseCursors.none,
      mouseStylesStack: [
        MouseStyle(
          size: const Size(8, 8),
          latency: const Duration(milliseconds: 25),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 242, 65),
              shape: BoxShape.circle),
        ),
        MouseStyle(
          size: const Size(26, 26),
          latency: const Duration(milliseconds: 75),
          visibleOnHover: false,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                )
              ],
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white)),
        ),
      ],
      child: MaterialApp(
        title: 'Mark Maher Website',
        theme: ThemeData(fontFamily: Fonts.cinzel),
        debugShowCheckedModeBanner: false,
        initialRoute: WebsiteRoutes.landing,
        routes: routes,
      ),
    );
  }
}

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
      Scrollable.ensureVisible(context, duration: Duration(seconds: 1));
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
          title: Row(children: [
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
          ]),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: glowingBtn(title: "Contact", onTap: () {}),
            )
          ],
          leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(
                HugeIcons.strokeRoundedMentor,
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
        drawer: Drawer(),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  ImageManager.background1,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
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
                                      Text(
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
                                              textStyle: TextStyle(
                                                  fontSize: 25,
                                                  color: const Color.fromARGB(
                                                      255, 255, 42, 42))),
                                          ColorizeAnimatedText(
                                              'Enterpreneur - Software Engineer',
                                              colors: colorizeColors,
                                              textStyle: TextStyle(
                                                  fontSize: 25,
                                                  color: const Color.fromARGB(
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    for (int i = 0; i < myProjects.length; i++)
                                      ProjectWidget(model: myProjects[i])
                                  ],
                                )
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
                                  "Contact Me",
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Card(
                                    child: Row(
                                      children: [
                                        Icon(
                                          HugeIcons.strokeRoundedPhoneOff01,
                                        ),
                                        Text(""),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder())
                              ]))
                        ],
                      ))),
            ],
          ),
        ));
  }
}

class ProjectWidget extends StatefulWidget {
  final ProjectModel model;

  const ProjectWidget({Key? key, required this.model}) : super(key: key);

  @override
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onHover: (value) {
          setState(() {
            hover = value;
          });
        },
        onTap: () {
          // Define onTap behavior here if needed
        },
        child: Stack(
          children: [
            Container(
              width: 700,
              height: 500,
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.model.image.toString(),
                          fit: BoxFit.cover,
                          height: 400,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            widget.model.name.toString(),
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
            Container(
              width: 700,
              height: 500,
              decoration: BoxDecoration(
                color: hover
                    ? const Color.fromARGB(137, 0, 116, 183)
                    : Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
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

Widget glowingBtn(
    {required String title, required VoidCallback onTap, double padding = 10}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      // margin: const EdgeInsets.all(10),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
          )
        ],
        color: const Color.fromARGB(255, 54, 111, 33),
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: const Color.fromARGB(255, 66, 212, 26), width: 2),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
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
