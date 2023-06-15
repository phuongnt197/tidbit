import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

// A screen that allows users to take a picture using a given camera.
class FoodImg extends StatefulWidget {
  const FoodImg({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  FoodImgState createState() => FoodImgState();
}

class FoodImgState extends State<FoodImg> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a picture'),
        backgroundColor: const Color(0xff00B195),
      ),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        backgroundColor: const Color(0xff00B195),
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            if (!mounted) return;

            // final File capturedImage = File(image.path);
            const endpoint = "https://6e3d-114-70-9-227.ngrok-free.app/food/";
            final request = http.MultipartRequest('POST', Uri.parse(endpoint));
            var imageStream = http.ByteStream(File(image.path).openRead());
            var imageLength = await image.length();
            var imageUpload = http.MultipartFile(
                'file', imageStream, imageLength,
                filename: 'image.jpg');
            request.files.add(imageUpload);

            print(request.toString());

            var res = await request.send();

            var responseString = await res.stream.bytesToString();

            // Parse the response JSON
            var jsonResponse = json.decode(responseString);

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: jsonResponse["segmentation"],
                  detectedFoods: jsonResponse["detected_foods"],
                  totalCalories: jsonResponse["calories"],
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            if (kDebugMode) {
              print(e);
            }
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final List<dynamic> detectedFoods;
  final dynamic totalCalories;

  const DisplayPictureScreen({
    super.key,
    required this.imagePath,
    required this.detectedFoods,
    required this.totalCalories,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> foodWithCalories = [
      Image.memory(
        base64Decode(imagePath),
      ),
      const Padding(padding: EdgeInsets.all(10)),
      Text(
        "$totalCalories kcal",
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontFamily: "Cabin",
          fontWeight: FontWeight.w400,
        ),
      ),
      const Padding(padding: EdgeInsets.all(5)),
      Container(
        width: 126,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          color: Color(0xff00b195),
        ),
        child: const Center(
          child: Text(
            "Details",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: "Cabin",
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
      const Padding(padding: EdgeInsets.all(10)),
    ];
    int i = 1;
    for (final String food in detectedFoods) {
      foodWithCalories.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$i. $food",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: "Cabin",
              fontWeight: FontWeight.w400,
            ),
          ),
          const Text(
            "250kcal",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: "Cabin",
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ));
      i++;
    }

    foodWithCalories.addAll([
      const Padding(padding: EdgeInsets.all(10)),
      InkWell(
        child: Container(
          width: 304,
          height: 58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            color: Color(0xff00b195),
          ),
          child: const Center(
            child: Text(
              "Done",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "Cabin",
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
      ),
    ]);

    return Scaffold(
      appBar: AppBar(title: const Text('Your calories intake of the meal')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: foodWithCalories,
      ),
    );
  }
}
