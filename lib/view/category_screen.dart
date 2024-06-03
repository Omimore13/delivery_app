import 'package:delivery_app/static_methods/styles.dart';
import 'package:delivery_app/view/splash_screen.dart';
import 'package:delivery_app/view/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../static_methods/bottomnavigationPage.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isFocused = false;

  TextEditingController searchCtrl = TextEditingController();
  List<dynamic> categoryList = [
    {
      "name": "Vegetables",
      "id": "1",
      "image": "assets/vegies.png",
      "qty": "43"
    },
    {"name": "Fruits", "id": "1", "image": "assets/fruits.png", "qty": "32"},
    {"name": "Bread", "id": "1", "image": "assets/bread.png", "qty": "22"},
    {"name": "Sweets", "id": "1", "image": "assets/sweets.png", "qty": "56"},
    {"name": "Coffee", "id": "1", "image": "assets/coffee.png", "qty": "26"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBarLayout(context, 0),
      backgroundColor: Clr().bgWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Clr().bgWhite,
        surfaceTintColor: Clr().bgWhite,
        toolbarHeight: 38,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Splash(),
                    ));
              },
              child: SvgPicture.asset(
                "assets/back.svg",
              )),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 1000) {
              return tabLandScapeLayout(context);
            } else if (constraints.maxWidth > 600) {
              return tabPortraitLayout(context);
            } else {
              return mobileLayout(context);
            }
          },
        ),
      ),
    );
  }


  ///Card Design Code
  Widget cardLayout(ctx, index, {list}) {
    var v = list[index];

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubCategory(
                sCatName: v['name'].toString(),
              ),
            ));
      },
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Clr().white,
          border: Border.all(color: Clr().formBorder),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                color: Clr().shimmerColor.withOpacity(0.1),
                blurRadius: 15,
                spreadRadius: 4)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(v['image']),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                v['name'].toString(),
                style: Sty().largeText,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "(${v['qty'].toString()})",
                style: Sty().microText.copyWith(color: Clr().textSecondary),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  /// Tablet LandScape Layout Code
  Widget tabLandScapeLayout(ctx) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: Sty().mediumText.copyWith(
              height: 1.2,
              fontWeight: FontWeight.w700,
              fontSize: 34,
              fontFamily: "SFBOLD"),
        ),
        const SizedBox(
          height: 20,
        ),
        Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              isFocused = hasFocus;
            });
          },
          child: TextFormField(
            controller: searchCtrl,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            cursorColor: Clr().textcolor,
            style: Sty().mediumText,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
            obscureText: false,
            decoration: Sty().textFieldOutlineStyle.copyWith(
                fillColor: Clr().white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(55),
                  borderSide: BorderSide(
                    color: searchCtrl.text.isNotEmpty || isFocused
                        ? Clr().primaryColor
                        : Clr().formBorder,
                  ),
                ),
                hintStyle: Sty().smallText.copyWith(
                      color: Clr().textSecondary,
                    ),
                hintText: "Search",
                counterText: "",
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SvgPicture.asset(
                    'assets/search.svg',
                    color: searchCtrl.text.isNotEmpty || isFocused
                        ? Clr().primaryColor
                        : Clr().black,
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        GridView.builder(
            itemCount: categoryList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 400,
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return cardLayout(context, index, list: categoryList);
            }),
      ],
    );
  }

  /// Tablet portrait Layout Code
  Widget tabPortraitLayout(ctx) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: Sty().mediumText.copyWith(
              height: 1.2,
              fontWeight: FontWeight.w700,
              fontSize: 34,
              fontFamily: "SFBOLD"),
        ),
        const SizedBox(
          height: 20,
        ),
        Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              isFocused = hasFocus;
            });
          },
          child: TextFormField(
            controller: searchCtrl,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            cursorColor: Clr().textcolor,
            style: Sty().mediumText,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
            obscureText: false,
            decoration: Sty().textFieldOutlineStyle.copyWith(
                fillColor: Clr().white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(55),
                  borderSide: BorderSide(
                    color: searchCtrl.text.isNotEmpty || isFocused
                        ? Clr().primaryColor
                        : Clr().formBorder,
                  ),
                ),
                hintStyle: Sty().smallText.copyWith(
                      color: Clr().textSecondary,
                    ),
                hintText: "Search",
                counterText: "",
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SvgPicture.asset(
                    'assets/search.svg',
                    color: searchCtrl.text.isNotEmpty || isFocused
                        ? Clr().primaryColor
                        : Clr().black,
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        GridView.builder(
            itemCount: categoryList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 280,
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return cardLayout(context, index, list: categoryList);
            }),
      ],
    );
  }

  /// Mobile Layout Code
  Widget mobileLayout(ctx) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: Sty().mediumText.copyWith(
              height: 1.2,
              fontWeight: FontWeight.w700,
              fontSize: 34,
              fontFamily: "SFBOLD"),
        ),
        const SizedBox(
          height: 20,
        ),
        Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              isFocused = hasFocus;
            });
          },
          child: TextFormField(
            controller: searchCtrl,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            cursorColor: Clr().textcolor,
            style: Sty().mediumText,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
            obscureText: false,
            decoration: Sty().textFieldOutlineStyle.copyWith(
                fillColor: Clr().white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(55),
                  borderSide: BorderSide(
                    color: searchCtrl.text.isNotEmpty || isFocused
                        ? Clr().primaryColor
                        : Clr().formBorder,
                  ),
                ),
                hintStyle: Sty().smallText.copyWith(
                      color: Clr().textSecondary,
                    ),
                hintText: "Search",
                counterText: "",
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SvgPicture.asset(
                    'assets/search.svg',
                    color: searchCtrl.text.isNotEmpty || isFocused
                        ? Clr().primaryColor
                        : Clr().black,
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        GridView.builder(
            itemCount: categoryList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 212,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return cardLayout(context, index, list: categoryList);
            }),
      ],
    );
  }
}
