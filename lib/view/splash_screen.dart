import 'package:delivery_app/static_methods/styles.dart';
import 'package:delivery_app/view/payment_method_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'category_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Clr().primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/splash.svg",
            fit: BoxFit.fitHeight,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                color: Clr().bgWhite,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 104,
                    width: 104,
                    decoration: BoxDecoration(
                        color: Clr().white, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: SvgPicture.asset("assets/box.svg"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Non-Contact\nDeliveries",
                    textAlign: TextAlign.center,
                    style: Sty().mediumText.copyWith(
                        height: 1.2,
                        fontWeight: FontWeight.w800,
                        fontSize: 34,
                        fontFamily: "SFBOLD"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "When placing an order, select the option “Contactless delivery” and the courier will leave your order at the door.",
                      textAlign: TextAlign.center,
                      style: Sty().mediumText.copyWith(
                            color: Clr().textSecondary,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 56,
                    width: MediaQuery.of(context).size.width / 1.15,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Category(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Clr().greenColor,
                        ),
                        child: Text(
                          "ORDER NOW",
                          style: Sty().mediumText.copyWith(
                              fontWeight: FontWeight.w600, color: Clr().white),
                        )),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "DISMISS",
                    style: Sty().smallText.copyWith(color: Clr().textSecondary),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
          Positioned(top: 63, child: SvgPicture.asset("assets/logo.svg")),
        ],
      ),
    );
  }
}
