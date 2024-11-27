import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
          size: const Size(20, 20),
          latency: const Duration(milliseconds: 25),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.white.withOpacity(0.4)),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: glowingBtn(title: "Contact", onTap: () {}),
            )
          ],
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Mark Maher',
              style: TextStyle(color: Colors.white),
            ),
          ),
          automaticallyImplyLeading: true,
          leadingWidth: 100,
          backgroundColor: Colors.transparent,
        ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        text: 'Strong problem-solving skilles'),
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
                                      child: Image.asset(ImageManager.myImage)))
                            ],
                          ),
                          SizedBox(
                            height: 50,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0; i < myProjects.length; i++)
                                projectWidget(model: myProjects[i])
                            ],
                          )
                        ],
                      ))),
            ],
          ),
        ));
  }
}

Widget projectWidget({required ProjectModel model}) {
  return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 700,
          height: 500,
          child: Center(
              child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    model.image.toString(),
                    fit: BoxFit.cover,
                  )),
              Text(
                model.name.toString(),
                style: TextStyle(),
              ),
            ],
          )),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 2)),
        ),
      ));
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
