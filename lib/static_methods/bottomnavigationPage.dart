import 'package:delivery_app/view/category_screen.dart';
import 'package:delivery_app/view/payment_method_screen.dart';
import 'package:flutter/material.dart';

import 'styles.dart';

Widget bottomBarLayout(ctx, index) {
  return BottomNavigationBar(
      elevation: 10,
      backgroundColor: Clr().white,
      // unselectedItemColor: Clr().black,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Clr().primaryColor,
      unselectedItemColor: Clr().textSecondary,
      showSelectedLabels: true,
      selectedFontSize: 14,
      selectedLabelStyle: TextStyle(color: Clr().textcolor),
      currentIndex: index,
      onTap: (i) async {
        switch (i) {
          case 0:
            Navigator.pushAndRemoveUntil(
              ctx,
              MaterialPageRoute(
                builder: (context) => Category(),
              ),
              (Route<dynamic> route) => false,
            );
            break;
          case 1:
            index == 1
                ? Navigator.push(
                    ctx,
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodScreen(),
                    ))
                : Navigator.push(
                    ctx,
                    MaterialPageRoute(
                        builder: (context) => PaymentMethodScreen()));
            break;

          // case 2:
          //   index == 2
          //       ? Navigator.push(
          //           ctx,
          //           MaterialPageRoute(
          //             builder: (context) => PaymentMethodScreen(),
          //           ))
          //       : Navigator.push(
          //           ctx,
          //           MaterialPageRoute(
          //               builder: (context) => PaymentMethodScreen()));
          //   break;
        }
      },
      items: Sty().getBottomList(index));
}
