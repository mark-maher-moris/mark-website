import 'package:flutter/material.dart';
import 'package:mark_website/main.dart';

class WebsiteRoutes {
  static const String landing = "/";
  static const String contact = "/contact";
  static const String portfolio = "/portfolio";
}

Map<String, WidgetBuilder> routes = {
  WebsiteRoutes.landing: (context) => const HomeLandingPage(),
  // WebsiteRoutes.contact: (context) => const ContactPage(),
  // WebsiteRoutes.portfolio: (context) => const PortfolioPage(),
};

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Page Not Found",
        style: Theme.of(context).textTheme.headlineLarge,
      )),
    );
  }
}
