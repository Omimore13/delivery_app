import 'package:delivery_app/static_methods/styles.dart';
import 'package:delivery_app/view/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../static_methods/bottomnavigationPage.dart';

class SubCategory extends StatefulWidget {
  final sCatName;

  const SubCategory({super.key, this.sCatName});

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  bool isFocused = false;

  TextEditingController searchCtrl = TextEditingController();

  List<dynamic> subCategoryList = [
    {
      "name": "Boston Lettuce",
      "id": "1",
      "image": "assets/boston.png",
      "price": "1.10",
      "qty": "piece"
    },
    {
      "name": "Purple Cauliflower",
      "id": "1",
      "image": "assets/cauilflower.png",
      "price": "1.85",
      "qty": "kg"
    },
    {
      "name": "Savoy Cabbage",
      "id": "1",
      "image": "assets/cabbage.png",
      "price": "1.15",
      "qty": "kg",
    },
    {
      "name": "Boston Lettuce",
      "id": "1",
      "image": "assets/boston.png",
      "price": "1.10",
      "qty": "piece"
    },
    {
      "name": "Purple Cauliflower",
      "id": "1",
      "image": "assets/cauilflower.png",
      "price": "1.85",
      "qty": "kg"
    },
    {
      "name": "Savoy Cabbage",
      "id": "1",
      "image": "assets/cabbage.png",
      "price": "1.15",
      "qty": "kg",
    },
  ];
  List<dynamic> selectedtypesList = [];
  List<dynamic> typeList = [
    {
      "name": "Сabbage and lettuce (14)",
      "id": "1",
    },
    {
      "name": "Сucumbers and tomatoes (10)",
      "id": "2",
    },
    {
      "name": "Potatoes and carrots (4)",
      "id": "3  ",
    },
  ];
  List<dynamic> typeList2 = [
    {
      "name": "Oinons and garlic (8)",
      "id": "1",
    },
    {
      "name": "Peppers (7)",
      "id": "2",
    },
    {
      "name": "Potatoes and carrots (4)",
      "id": "3  ",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomBarLayout(context, 0),
        backgroundColor: Clr().bgWhite,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          toolbarHeight: 38,
          leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  "assets/back.svg",
                )),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(
                "assets/vegies_bg.svg",
              ),
            ),
            LayoutBuilder(
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
          ],
        ));
  }

  ///Product List Layout
  Widget cardLayout(ctx, index, list) {
    var v = list[index];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    pDetails: v,
                  ),
                ));
          },
          child: Container(
              width: 177,
              height: 128,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(v['image'].toString()))),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                v['name'].toString(),
                style: Sty().mediumText.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: v['price'].toString(),
                      style: Sty().microText.copyWith(
                            color: Clr().textcolor,
                            fontSize: 22,
                            fontFamily: "SFBold",
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    TextSpan(
                      text: ' € / ${v['qty']}',
                      style: Sty().microText.copyWith(
                            color: Clr().textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                foregroundColor: Clr().primaryLightColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(color: Clr().formBorder)),
                                backgroundColor: Clr().white,
                                surfaceTintColor: Clr().white),
                            child: SvgPicture.asset(
                              "assets/un_like.svg",
                              width: 20,
                            ))),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                foregroundColor: Clr().black,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(color: Clr().greenColor)),
                                backgroundColor: Clr().greenColor,
                                surfaceTintColor: Clr().greenColor),
                            child: SvgPicture.asset(
                              "assets/cart.svg",
                              width: 22,
                            ))),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  /// Tablet LandScape Layout Code
  Widget tabLandScapeLayout(ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90,
          ),
          Text(
            widget.sCatName.toString() ?? "",
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
            height: 32,
          ),
          SizedBox(
            height: 34,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: typeList.length,
              itemBuilder: (context, index) {
                final item = typeList[index];
                var v = item;
                final isSelected = selectedtypesList.contains(item);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedtypesList.remove(item);
                      } else {
                        selectedtypesList.add(item);
                      }
                    });
                  },
                  child: Container(
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      color: isSelected ? Clr().primaryLightColor : Clr().white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            isSelected
                                ? SvgPicture.asset("assets/tick.svg")
                                : SizedBox(),
                            isSelected
                                ? SizedBox(
                                    width: 12,
                                  )
                                : SizedBox(),
                            Text(
                              '${v['name']}',
                              style: Sty().smallText.copyWith(
                                  color: isSelected
                                      ? Clr().accentColor
                                      : Clr().textSecondary,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 34,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: typeList2.length,
              itemBuilder: (context, index) {
                final item = typeList2[index];
                var v = item;
                final isSelected = selectedtypesList.contains(item);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedtypesList.remove(item);
                      } else {
                        selectedtypesList.add(item);
                      }
                    });
                  },
                  child: Container(
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      color: isSelected ? Clr().primaryLightColor : Clr().white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            isSelected
                                ? SvgPicture.asset("assets/tick.svg")
                                : SizedBox(),
                            isSelected
                                ? SizedBox(
                                    width: 12,
                                  )
                                : SizedBox(),
                            Text(
                              '${v['name']}',
                              style: Sty().smallText.copyWith(
                                  color: isSelected
                                      ? Clr().accentColor
                                      : Clr().textSecondary,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          // Expanded(
          //   child: ListView.separated(
          //     separatorBuilder: (context, index) {
          //       return SizedBox(
          //         height: 36,
          //       );
          //     },
          //     padding: EdgeInsets.only(bottom: 40),
          //     shrinkWrap: true,
          //     itemCount: subCategoryList.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return cardLayout(context, index, subCategoryList);
          //     },
          //   ),
          // ),

          Expanded(
            child: GridView.builder(
                itemCount: subCategoryList.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 160,
                  crossAxisCount: 3,
                  crossAxisSpacing: 60,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return cardLayout(context, index, subCategoryList);
                }),
          ),
        ],
      ),
    );
  }

  /// Tablet portrait Layout Code
  Widget tabPortraitLayout(ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90,
          ),
          Text(
            widget.sCatName.toString() ?? "",
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
            height: 32,
          ),
          SizedBox(
            height: 34,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: typeList.length,
              itemBuilder: (context, index) {
                final item = typeList[index];
                var v = item;
                final isSelected = selectedtypesList.contains(item);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedtypesList.remove(item);
                      } else {
                        selectedtypesList.add(item);
                      }
                    });
                  },
                  child: Container(
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      color: isSelected ? Clr().primaryLightColor : Clr().white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            isSelected
                                ? SvgPicture.asset("assets/tick.svg")
                                : SizedBox(),
                            isSelected
                                ? SizedBox(
                                    width: 12,
                                  )
                                : SizedBox(),
                            Text(
                              '${v['name']}',
                              style: Sty().smallText.copyWith(
                                  color: isSelected
                                      ? Clr().accentColor
                                      : Clr().textSecondary,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 34,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: typeList2.length,
              itemBuilder: (context, index) {
                final item = typeList2[index];
                var v = item;
                final isSelected = selectedtypesList.contains(item);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedtypesList.remove(item);
                      } else {
                        selectedtypesList.add(item);
                      }
                    });
                  },
                  child: Container(
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      color: isSelected ? Clr().primaryLightColor : Clr().white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            isSelected
                                ? SvgPicture.asset("assets/tick.svg")
                                : SizedBox(),
                            isSelected
                                ? SizedBox(
                                    width: 12,
                                  )
                                : SizedBox(),
                            Text(
                              '${v['name']}',
                              style: Sty().smallText.copyWith(
                                  color: isSelected
                                      ? Clr().accentColor
                                      : Clr().textSecondary,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: subCategoryList.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 160,
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return cardLayout(context, index, subCategoryList);
                }),
          ),
        ],
      ),
    );
  }

  /// Mobile Layout Code
  Widget mobileLayout(ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90,
          ),
          Text(
            widget.sCatName.toString() ?? "",
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
            height: 32,
          ),
          SizedBox(
            height: 34,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: typeList.length,
              itemBuilder: (context, index) {
                final item = typeList[index];
                var v = item;
                final isSelected = selectedtypesList.contains(item);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedtypesList.remove(item);
                      } else {
                        selectedtypesList.add(item);
                      }
                    });
                  },
                  child: Container(
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      color: isSelected ? Clr().primaryLightColor : Clr().white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            isSelected
                                ? SvgPicture.asset("assets/tick.svg")
                                : SizedBox(),
                            isSelected
                                ? SizedBox(
                                    width: 12,
                                  )
                                : SizedBox(),
                            Text(
                              '${v['name']}',
                              style: Sty().smallText.copyWith(
                                  color: isSelected
                                      ? Clr().accentColor
                                      : Clr().textSecondary,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 34,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: typeList2.length,
              itemBuilder: (context, index) {
                final item = typeList2[index];
                var v = item;
                final isSelected = selectedtypesList.contains(item);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedtypesList.remove(item);
                      } else {
                        selectedtypesList.add(item);
                      }
                    });
                  },
                  child: Container(
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      color: isSelected ? Clr().primaryLightColor : Clr().white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            isSelected
                                ? SvgPicture.asset("assets/tick.svg")
                                : SizedBox(),
                            isSelected
                                ? SizedBox(
                                    width: 12,
                                  )
                                : SizedBox(),
                            Text(
                              '${v['name']}',
                              style: Sty().smallText.copyWith(
                                  color: isSelected
                                      ? Clr().accentColor
                                      : Clr().textSecondary,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 36,
                );
              },
              padding: EdgeInsets.only(bottom: 40),
              shrinkWrap: true,
              itemCount: subCategoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return cardLayout(context, index, subCategoryList);
              },
            ),
          ),
        ],
      ),
    );
  }
}
