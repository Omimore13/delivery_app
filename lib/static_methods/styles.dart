import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class Sty {
  TextStyle microText = TextStyle(
    fontFamily: 'SF',
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 12.0,
  );
  TextStyle smallText = TextStyle(
    fontFamily: 'SF',
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 14.0,
  );
  TextStyle mediumText = TextStyle(
    fontFamily: 'SF',
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 16.0,
  );
  TextStyle mediumBoldText = TextStyle(
    fontFamily: 'SF',
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );
  TextStyle largeText = TextStyle(
    fontFamily: 'SF',
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
  );
  TextStyle extraLargeText = TextStyle(
    fontFamily: 'SF',
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
  );


  InputDecoration textFieldOutlineStyle = InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(55),
      borderSide: BorderSide(
        color: Clr().formBorder,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(55),
      borderSide: BorderSide(
        color: Clr().primaryColor,
      ),
    ),
  );


  List<BottomNavigationBarItem> getBottomList(index, ) {
    return [
      BottomNavigationBarItem(
        icon: index == 0
            ? SvgPicture.asset('assets/grid_fill.svg')
            : SvgPicture.asset(
          "assets/grid.svg",
        ),
        label: 'Category',
        backgroundColor: index == 0 ? const Color(0xffBFDFFF) : Clr().white,
      ),
      BottomNavigationBarItem(
        icon: index == 1
            ? SvgPicture.asset('assets/shoppingcart_fill.svg')
            : SvgPicture.asset(
          "assets/shopping_cart.svg",
        ),
        label: 'My Cart',
        backgroundColor: index == 1 ? const Color(0xffBFDFFF) : Clr().white,
      ),
      BottomNavigationBarItem(
        icon: index == 2
            ? SvgPicture.asset('assets/user.svg')
            : SvgPicture.asset(
          "assets/user.svg",
        ),
        label: 'Profile',
        backgroundColor: index == 1 ? const Color(0xffBFDFFF) : Clr().white,
      ),

    ];
  }

}

class Clr{
  Color primaryColor = const Color(0xffA259FF);
  Color primaryLightColor = const Color(0xffE2CBFF);
  Color accentColor = const Color(0xff6C0EE4);
  Color greenColor = const Color(0xff0BCE83);
  Color textcolor = const Color(0xFF2D0C57);
  Color textSecondary = const Color(0xFF9586A8);
  Color white = const Color(0xFFFFFFFF);
  Color bgWhite = const Color(0xFFF6F5F5);
  Color black = const Color(0xFF000000);
  Color shimmerColor = const Color(0xFFABABAB);
  Color formBorder = const Color(0xFFD9D0E3);
  Color red = const Color(0xFFFF0000);
}

