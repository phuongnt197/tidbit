import 'package:flutter/material.dart';
import 'package:frontend/food_img.dart';
import 'package:frontend/function.dart';
import 'package:frontend/goals.dart';
import 'package:frontend/homepage.dart';
import 'package:camera/camera.dart';
import 'package:frontend/intake_records.dart';
import 'package:frontend/my_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  runApp(MyApp(
    camera: firstCamera,
  ));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;
  const MyApp({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      theme: ThemeData(
        primarySwatch: buildMaterialColor(const Color(0xff479B82)),
        fontFamily: 'Spoqa_Han_Sans_Neo',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/food_img': (context) => FoodImg(
              camera: camera,
            ),
        '/intake_records': (context) => const IntakeRecords(),
        '/goals': (context) => const Goals(),
        '/my_profile': (context) => const MyProfile(),
      },
    );
  }
}
