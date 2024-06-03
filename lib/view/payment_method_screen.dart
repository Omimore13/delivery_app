import 'dart:io';

import 'package:delivery_app/bloc/payment_bloc/payment_events.dart';
import 'package:delivery_app/bloc/payment_bloc/payment_method_bloc.dart';
import 'package:delivery_app/bloc/payment_bloc/payment_states.dart';
import 'package:delivery_app/static_methods/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../static_methods/bottomnavigationPage.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();
  TextEditingController dateCtrl = TextEditingController();
  TextEditingController cvvCtrl = TextEditingController();
  bool isFocused = false;
  bool isFocused2 = false;
  bool isFocused3 = false;
  bool isFocused4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: bottomBarLayout(context, 1),
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
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                "assets/back.svg",
              )),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Credit / Debit card",
              style: Sty().mediumText.copyWith(
                  height: 1.2,
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  fontFamily: "SFBOLD"),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<ImagePickerBloc, ImagePickerStates>(
              builder: (context, state) {
                if (state.file == null) {
                  return Container(
                      height: 240,
                      decoration: BoxDecoration(border: Border.all(color: Clr().formBorder),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Clr()
                                  .shimmerColor
                                  .withOpacity(state.file == null ? 0.0 : 0.1),
                              blurRadius: 5,
                              spreadRadius: 2)
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocBuilder<ImagePickerBloc, ImagePickerStates>(
                              builder: (context, state) {
                                print("Camera");
                                return InkWell(
                                    onTap: () {
                                      showCardBottomSheet(context, "Select Image");
                                      // context.read<ImagePickerBloc>().add(GalleryImageCapture());
                                    },
                                    child: Center(child: SvgPicture.asset("assets/camera.svg")));
                              }),
                          const SizedBox(height: 20,),
                          Text("Upload your credit / debit card photo",
                          style: Sty().smallText.copyWith(
                            color: Clr().textSecondary
                          ),),
                        ],
                      )));
                } else {
                  return Container(
                      height: 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Clr().shimmerColor.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 2)
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(state.file!.path.toString()),
                          fit: BoxFit.cover,
                        ),
                      ));
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<ImagePickerBloc, ImagePickerStates>(
                builder: (context, state) {
              print("Camera");

              return state.file == null ?  SizedBox() : InkWell(
                  onTap: () {
                    showCardBottomSheet(context, "Select Image");
                    // context.read<ImagePickerBloc>().add(GalleryImageCapture());
                  },
                  child: Center(child: SvgPicture.asset("assets/camera.svg")));
            }),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Name on card",
                style: Sty().smallText.copyWith(color: Clr().textSecondary),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  isFocused = hasFocus;
                });
              },
              child: TextFormField(
                controller: nameCtrl,
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
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: nameCtrl.text.isNotEmpty || isFocused
                              ? Clr().primaryColor
                              : Clr().formBorder,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Clr().primaryColor,
                        ),
                      ),
                      hintStyle: Sty().smallText.copyWith(
                            color: Clr().textSecondary,
                          ),
                      hintText: "Enter name on the card",
                      counterText: "",
                    ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Card Number",
                style: Sty().smallText.copyWith(color: Clr().textSecondary),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  isFocused2 = hasFocus;
                });
              },
              child: TextFormField(
                controller: numberCtrl,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                cursorColor: Clr().textcolor,
                style: Sty().mediumText,
                keyboardType: TextInputType.number,
                maxLength: 16,
                textInputAction: TextInputAction.done,
                obscureText: false,
                decoration: Sty().textFieldOutlineStyle.copyWith(
                      fillColor: Clr().white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: nameCtrl.text.isNotEmpty || isFocused2
                              ? Clr().primaryColor
                              : Clr().formBorder,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Clr().primaryColor,
                        ),
                      ),
                      hintStyle: Sty().smallText.copyWith(
                            color: Clr().textSecondary,
                          ),
                      hintText: "Enter your card number",
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset("assets/mc_logo.svg"),
                      ),
                      counterText: "",
                    ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Expiry date",
                          style: Sty()
                              .smallText
                              .copyWith(color: Clr().textSecondary),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Focus(
                        onFocusChange: (hasFocus) {
                          setState(() {
                            isFocused = hasFocus;
                          });
                        },
                        child: TextFormField(
                          controller: dateCtrl,
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          cursorColor: Clr().textcolor,
                          style: Sty().mediumText,
                          keyboardType: TextInputType.text,
                          maxLength: 5,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: Sty().textFieldOutlineStyle.copyWith(
                                fillColor: Clr().white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: dateCtrl.text.isNotEmpty || isFocused
                                        ? Clr().primaryColor
                                        : Clr().formBorder,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Clr().primaryColor,
                                  ),
                                ),
                                hintStyle: Sty().smallText.copyWith(
                                      color: Clr().textSecondary,
                                    ),
                                hintText: "MM/YY",
                                counterText: "",
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "CVC",
                          style: Sty()
                              .smallText
                              .copyWith(color: Clr().textSecondary),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Focus(
                        onFocusChange: (hasFocus) {
                          setState(() {
                            isFocused4 = hasFocus;
                          });
                        },
                        child: TextFormField(
                          controller: cvvCtrl,
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          cursorColor: Clr().textcolor,
                          style: Sty().mediumText,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          maxLength: 3,
                          decoration: Sty().textFieldOutlineStyle.copyWith(
                            fillColor: Clr().white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: nameCtrl.text.isNotEmpty || isFocused4
                                    ? Clr().primaryColor
                                    : Clr().formBorder,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Clr().primaryColor,
                              ),
                            ),
                            hintStyle: Sty().smallText.copyWith(
                              color: Clr().textSecondary,
                            ),
                            hintText: "Enter your cvv number",
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset("assets/cvv.svg",width: 12,),
                            ),
                            counterText: "",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),


            const SizedBox(
              height: 55,
            ),
            SizedBox(
              height: 56,
              width: MediaQuery.of(context).size.width ,
              child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       // builder: (context) => Category(),
                    //     ));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: Clr().greenColor,
                  ),
                  child: Text(
                    "USE THIS CARD",
                    style: Sty().mediumText.copyWith(
                      fontSize: 15,
                        fontWeight: FontWeight.w600, color: Clr().white),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  ///Bottom sheet to select camera or gallery
  void showCardBottomSheet(ctx, name) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Clr().primaryLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (index) {
        return Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Clr().primaryLightColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Text(
                  name,
                  // 'Upload Aadhar Card Back',
                  style: Sty().mediumBoldText.copyWith(
                        fontSize: 18,
                      ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocBuilder<ImagePickerBloc, ImagePickerStates>(
                      builder: (context, state) {
                    print("Camera");
                    return InkWell(
                      onTap: () {
                        context.read<ImagePickerBloc>().add(CameraCapture());
                      },
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 32,
                        color: Clr().primaryColor,
                      ),
                    );
                  }),
                  Container(
                    height: 50,
                    width: 1,
                    color: Clr().textcolor,
                  ),
                  BlocBuilder<ImagePickerBloc, ImagePickerStates>(
                      builder: (context, state) {
                    print("Gallery");
                    return InkWell(
                      onTap: () {
                        context
                            .read<ImagePickerBloc>()
                            .add(GalleryImageCapture());
                      },
                      child: Icon(
                        Icons.yard_outlined,
                        size: 32,
                        color: Clr().primaryColor,
                      ),
                    );
                  })
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
