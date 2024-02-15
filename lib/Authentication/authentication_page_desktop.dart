import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthsync/Authentication/sign_in/sign_in_page_desktop.dart';

class AuthenticationPageDesktop extends StatefulWidget {
  const AuthenticationPageDesktop({super.key});

  @override
  State<AuthenticationPageDesktop> createState() =>
      _AuthenticationPageDesktopState();
}

class _AuthenticationPageDesktopState extends State<AuthenticationPageDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      Flexible(
        flex: 1,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color.fromARGB(255, 36, 93, 90),
                Color.fromARGB(255, 53, 143, 125),
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo_white.png'),
              Text(
                "Health Sync",
                style: GoogleFonts.kronaOne(
                  color: Colors.white,
                  fontSize: 62,
                ),
              ),
            ],
          ),
        ),
      ),
      Flexible(flex: 1, child: SignInPageDesktop())
    ]));
  }
}
