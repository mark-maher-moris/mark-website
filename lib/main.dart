import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mark_website/fonts.dart';
import 'package:mark_website/image_manager.dart';
import 'package:mark_website/project_model.dart';
import 'package:mark_website/projects_data.dart';
import 'package:mark_website/rotes.dart';
import 'package:mark_website/strings_manager.dart';
import 'package:mouse_follower/mouse_follower.dart';
import 'package:simple_grid/simple_grid.dart';
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
        const MouseStyle(
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
        theme: ThemeData(fontFamily: Fonts.cinzel, splashColor: Colors.blue),
        debugShowCheckedModeBanner: false,
        initialRoute: WebsiteRoutes.landing,
        routes: routes,
      ),
    );
  }
}
