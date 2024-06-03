import 'package:delivery_app/bloc/payment_bloc/payment_method_bloc.dart';
import 'package:delivery_app/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/image_picker_utils.dart';
import 'bloc/payment_bloc/payment_states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffA259FF)),
          useMaterial3: true,
        ),
        home: Splash(),
      ),
    );
  }
}

