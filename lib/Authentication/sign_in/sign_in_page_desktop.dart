import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInPageDesktop extends StatefulWidget {
  const SignInPageDesktop({super.key});

  @override
  State<SignInPageDesktop> createState() => _SignInPageDesktopState();
}

class _SignInPageDesktopState extends State<SignInPageDesktop> {
  double x = 0;
  bool isPatient = false;
  bool codeSent = false;
  ConfirmationResult? confirmationResult;
  TextEditingController idTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController mobileNumberTextEditingController =
      TextEditingController();

  final verificationCodeKey = GlobalKey<FormState>();

  TextEditingController code1 = TextEditingController();
  TextEditingController code2 = TextEditingController();
  TextEditingController code3 = TextEditingController();
  TextEditingController code4 = TextEditingController();
  TextEditingController code5 = TextEditingController();
  TextEditingController code6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final devicHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: devicHeight * 0.5,
            width: deviceWidth * 0.25,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 36, 93, 90),
                    Color.fromARGB(255, 53, 143, 125),
                  ]),
              borderRadius: BorderRadius.circular(25),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding:
                      EdgeInsets.symmetric(horizontal: deviceWidth * 0.0625),
                  child: Container(
                    height: devicHeight * 0.05,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(6)),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 2,
                              child: AnimatedSlide(
                                  duration: const Duration(milliseconds: 200),
                                  offset: Offset(x, 0),
                                  curve: Curves.bounceInOut,
                                  child: Container(
                                    height: devicHeight * 0.05,
                                    width: deviceWidth * 0.05,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: const SizedBox(),
                                  )),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            const Spacer(
                              flex: 2,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              flex: 2,
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        x = 0;
                                        isPatient = false;
                                      });
                                    },
                                    child: Container(
                                        height: devicHeight * 0.05,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Center(
                                          child: Text(
                                            "Hospital",
                                            style: TextStyle(
                                              color: x == 0
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontWeight: x == 0
                                                  ? FontWeight.w500
                                                  : FontWeight.w600,
                                            ),
                                          ),
                                        ))
                                    // child: AnimatedContainer(
                                    //     duration:
                                    //         Duration(milliseconds: 500),
                                    //     height: devicHeight * 0.05,
                                    //     decoration: BoxDecoration(
                                    //         color: !isUser
                                    //             ? Colors.white
                                    //             : Colors.grey,
                                    //         borderRadius:
                                    //             BorderRadius.circular(6)),
                                    //     child: Center(
                                    //       child: Text("Admin"),
                                    //     )),
                                    ),
                              ),
                            ),
                            const Flexible(
                              flex: 1,
                              child: Center(
                                  child: VerticalDivider(
                                color: Colors.white,
                                thickness: 2.5,
                              )),
                            ),
                            Flexible(
                              flex: 2,
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        x = 1.5;
                                        isPatient = true;
                                      });
                                    },
                                    child: Container(
                                        height: devicHeight * 0.05,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Center(
                                          child: Text(
                                            "Patient",
                                            style: TextStyle(
                                                color: x == 1.5
                                                    ? Colors.black
                                                    : Colors.white,
                                                fontWeight: x == 1.5
                                                    ? FontWeight.w500
                                                    : FontWeight.w600),
                                          ),
                                        ))
                                    // child: AnimatedContainer(
                                    //     duration:
                                    //         Duration(milliseconds: 500),
                                    //     height: devicHeight * 0.05,
                                    //     decoration: BoxDecoration(
                                    //         color: isUser
                                    //             ? Colors.white
                                    //             : Colors.grey,
                                    //         borderRadius:
                                    //             BorderRadius.circular(6)),
                                    //     child: Center(
                                    //       child: Text("User"),
                                    //     )),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: devicHeight * 0.034,
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    height: devicHeight * 0.39,
                    width: deviceWidth * 0.25,
                    padding:
                        EdgeInsets.symmetric(horizontal: deviceWidth * 0.0125),
                    child: isPatient
                        ? patient(devicHeight, deviceWidth)
                        : hospital(deviceWidth),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget hospital(double deviceWidth) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          child: TextFormField(
            controller: idTextEditingController,
            cursorColor: const Color.fromARGB(255, 53, 143, 125),
            decoration: const InputDecoration(
              hintText: 'Identification Number',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, style: BorderStyle.solid)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, style: BorderStyle.solid)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, style: BorderStyle.solid)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, style: BorderStyle.solid)),
              focusedErrorBorder: OutlineInputBorder(),
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Flexible(
          flex: 2,
          child: TextFormField(
            controller: passwordTextEditingController,
            cursorColor: const Color.fromARGB(255, 53, 143, 125),
            decoration: const InputDecoration(
              hintText: 'Password',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, style: BorderStyle.solid)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, style: BorderStyle.solid)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, style: BorderStyle.solid)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, style: BorderStyle.solid)),
              focusedErrorBorder: OutlineInputBorder(),
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: deviceWidth * 0.03125),
                  child: FilledButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.black12;
                          } else {
                            return Colors.transparent;
                          }
                        }),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white)),
                    onPressed: () {},
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  style: ButtonStyle(
                      enableFeedback: true,
                      overlayColor: MaterialStateProperty.resolveWith((states) {
                        return Colors.transparent;
                      })),
                  onPressed: () {},
                  child: const Text(
                    'Register and continue to HealthSync',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ))
      ],
    );
  }

  Widget patient(double deviceHeight, double deviceWidth) {
    return Column(
      children: [
        Flexible(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                codeSent
                    ? Form(
                        key: verificationCodeKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: deviceHeight * 0.05,
                              width: deviceWidth * 0.025,
                              child: TextFormField(
                                controller: code1,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textAlign: TextAlign.center,
                                cursorColor:
                                    const Color.fromARGB(255, 53, 143, 125),
                                decoration: const InputDecoration(
                                  hintText: '0',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  focusedErrorBorder: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.05,
                              width: deviceWidth * 0.025,
                              child: TextFormField(
                                controller: code2,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textAlign: TextAlign.center,
                                cursorColor:
                                    const Color.fromARGB(255, 53, 143, 125),
                                decoration: const InputDecoration(
                                  hintText: '0',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  focusedErrorBorder: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.05,
                              width: deviceWidth * 0.025,
                              child: TextFormField(
                                controller: code3,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textAlign: TextAlign.center,
                                cursorColor:
                                    const Color.fromARGB(255, 53, 143, 125),
                                decoration: const InputDecoration(
                                  hintText: '0',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  focusedErrorBorder: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.05,
                              width: deviceWidth * 0.025,
                              child: TextFormField(
                                controller: code4,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textAlign: TextAlign.center,
                                cursorColor:
                                    const Color.fromARGB(255, 53, 143, 125),
                                decoration: const InputDecoration(
                                  hintText: '0',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  focusedErrorBorder: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.05,
                              width: deviceWidth * 0.025,
                              child: TextFormField(
                                controller: code5,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textAlign: TextAlign.center,
                                cursorColor:
                                    const Color.fromARGB(255, 53, 143, 125),
                                decoration: const InputDecoration(
                                  hintText: '0',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  focusedErrorBorder: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.05,
                              width: deviceWidth * 0.025,
                              child: TextFormField(
                                controller: code6,
                                onChanged: (value) {
                                  if (value.length == 1) {}
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textAlign: TextAlign.center,
                                cursorColor:
                                    const Color.fromARGB(255, 53, 143, 125),
                                decoration: const InputDecoration(
                                  hintText: '0',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 163, 84, 84),
                                          style: BorderStyle.solid)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  focusedErrorBorder: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : TextFormField(
                        controller: mobileNumberTextEditingController,
                        cursorColor: const Color.fromARGB(255, 53, 143, 125),
                        decoration: const InputDecoration(
                          hintText: 'Mobile Number',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid)),
                          focusedErrorBorder: OutlineInputBorder(),
                        ),
                      ),
              ],
            )),
        Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: deviceWidth * 0.03125),
                  child: FilledButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.black12;
                          } else {
                            return Colors.transparent;
                          }
                        }),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white)),
                    onPressed: () async {
                      if (codeSent) {
                        if (verificationCodeKey.currentState!.validate()) {
                          UserCredential userCredential =
                              await confirmationResult!.confirm(code1.text +
                                  code2.text +
                                  code3.text +
                                  code4.text +
                                  code5.text +
                                  code6.text);
                          log("${userCredential.user!.displayName}");
                        }
                      } else {
                        var confirmationResult = await FirebaseAuth.instance
                            .signInWithPhoneNumber(
                                "+91${mobileNumberTextEditingController.text}");
                        setState(() {
                          this.confirmationResult = confirmationResult;
                          codeSent = true;
                        });
                      }
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  style: ButtonStyle(
                      enableFeedback: true,
                      overlayColor:
                          MaterialStateProperty.resolveWith((states) {
                        return Colors.transparent;
                      })),
                  onPressed: () {},
                  child: const Text(
                    'Register and continue to HealthSync',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
