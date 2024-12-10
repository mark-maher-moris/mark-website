import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mark_website/consts.dart';
import 'package:mark_website/home_lanading_page.dart';
import 'package:mark_website/strings_manager.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

Widget customDrawer() {
  return Drawer(
      shadowColor: Colors.white,
      backgroundColor: Colors.black,
      elevation: 20,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              StringsManager.appName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            _drawerItem(
                title: 'Projects',
                icon: HugeIcons.strokeRoundedJoinBevel,
                onTap: () {}),
            _drawerItem(
                title: 'About Me',
                icon: HugeIcons.strokeRoundedPresentation01,
                onTap: () {}),
            _drawerItem(
                title: 'Certificates',
                icon: HugeIcons.strokeRoundedCertificate01,
                onTap: () {}),
            _drawerItem(
                title: 'Contact me',
                icon: HugeIcons.strokeRoundedContact,
                onTap: () {}),
            FlutterSocialButton(
              onTap: () {
                openLink(Consts.facebookLink);
              },
              title: 'Facebook',
              // mini: true,
              buttonType: ButtonType.facebook,
            ),
            FlutterSocialButton(
              onTap: () {
                openLink(Consts.instagramLink);
              },
              title: 'Instagram',
              // mini: true,
              buttonType: ButtonType.instagram,
            ),
            FlutterSocialButton(
              iconColor: const Color.fromARGB(255, 68, 12, 64),
              onTap: () {
                openLink(Consts.tiktokLink);
              },
              title: 'Tiktok',
              // mini: true,
              buttonType: ButtonType.tiktok,
            ),
          ],
        ),
      ));
}

Widget _drawerItem({String? title, IconData? icon, VoidCallback? onTap}) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    title ?? "",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            )),
        Divider(
          color: Colors.white,
          indent: 15,
          endIndent: 14,
        ),
      ],
    ),
  );
}
