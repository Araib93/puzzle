import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:puzzle/PuzzlePage.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarIconBrightness: Brightness.dark,
    //     statusBarColor: Colors.transparent));
    return Scaffold(
      body: _buildLandingPage(),
    );
  }

  Center _buildLandingPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Puzzle !",
            textScaleFactor: 5,
            style: TextStyle(
                color: Colors.deepPurple[400], fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 32),
          OutlineButton(
            child: Text("Select image from gallery"),
            onPressed: getImage,
          )
        ],
      ),
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null)
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PuzzlePage(image: image)));
  }
}
