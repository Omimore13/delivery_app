import 'package:delivery_app/view/payment_method_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../static_methods/styles.dart';

class ProductDetails extends StatefulWidget {
  final pDetails;

  const ProductDetails({
    Key? key,
    this.pDetails,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<dynamic> imageList = [
    {'image': "assets/boston.png"},
    {'image': "assets/boston.png"},
    {'image': "assets/boston.png"},
  ];


  @override
  Widget build(BuildContext context) {
    print(widget.pDetails);
    return Scaffold(
      backgroundColor: Clr().bgWhite,
      extendBodyBehindAppBar: true,
      body: SlidingUpPanel(
        minHeight: MediaQuery.of(context).size.height * 0.65,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        panelBuilder: (sc) => _slidingPannel(sc),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(28),
          topLeft: Radius.circular(28),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.4,
                viewportFraction: 1,
                enlargeCenterPage: false,
                scrollPhysics: BouncingScrollPhysics(),
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
              items: imageList
                  .map((e) => ClipRRect(
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.asset(
                              e['image'].toString(),
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _slidingPannel(ScrollController sc) {
    // int position = addToCart.indexWhere((e) => varientid == null
    //     ? e['product_id'] == int.parse(v['id'].toString())
    //     : e['varientid'] == varientid);
    return SingleChildScrollView(
      child: StatefulBuilder(builder: (context, setState2) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.pDetails['name'].toString(),
                style: Sty().largeText.copyWith(
                      fontSize: 30,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.pDetails['price'].toString(),
                      style: Sty().microText.copyWith(
                            color: Clr().textcolor,
                            fontSize: 32,
                            fontFamily: "SFBold",
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    TextSpan(
                      text: ' € / ${widget.pDetails['qty']}',
                      style: Sty().microText.copyWith(
                            fontSize: 24,
                            color: Clr().textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "~ 150 gr / piece",
                style: Sty().mediumText.copyWith(
                      color: Clr().greenColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Spain",
                style: Sty().largeText.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: "SFBold"),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Lettuce is an annual plant of the daisy family, Asteraceae. It is most often grown as a leaf vegetable, but sometimes for its stem and seeds. Lettuce is most often used for salads, although it is also seen in other kinds of food, such as soups, sandwiches and wraps; it can also be grilled.Lettuce is an annual plant of the daisy family, Asteraceae. It is most often grown as a leaf vegetable, but sometimes for its stem and seeds. Lettuce is most often used for salads, although it is also seen in other kinds of food, such as soups, sandwiches and wraps; it can also be grilled.",
                style: Sty().mediumText.copyWith(
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                    color: Clr().textSecondary),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                        height: 56,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Clr().primaryLightColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(color: Clr().formBorder)),
                                backgroundColor: Clr().white,
                                surfaceTintColor: Clr().white),
                            child: SvgPicture.asset("assets/un_like.svg"))),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                        height: 56,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaymentMethodScreen(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Clr().black,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(color: Clr().greenColor)),
                                backgroundColor: Clr().greenColor,
                                surfaceTintColor: Clr().greenColor),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                SvgPicture.asset("assets/cart.svg"),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "ADD TO CART",
                                  style: Sty().mediumText.copyWith(
                                        color: Clr().white,
                                      ),
                                ),
                              ],
                            ))),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        );
      }),
    );
  }
}
