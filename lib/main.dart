import 'dart:io';
import 'package:file/nextscreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "file",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final ImagePicker picker = ImagePicker();

//  File? selectimage;
  //String base = "";

//    Future <void> chooseImage(type) async{
//      var image;
//
//      if(type == "camera")
//      {
//        image = await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 10);
//      }
//      else{
//        image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 10);
//      }
//
//      if(image!= null){
//        setState(() {
//          selectimage = File(image.path);
//          base = base64Encode (selectimage!.readasBytesSync());
//        });
//      }
//
// }

  String seletedImagespath = "";

  List<Object> images = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
    });
  }

  //get image => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              seletedImagespath!=""
                  ? Image.file(File(seletedImagespath),width: 200,height: 300,
              )
                  : const SizedBox(
                      height: 40,
                    ),

              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                  onPressed: () async {
                    final XFile? f =
                        await picker.pickImage(source: ImageSource.gallery);
                    setState(()  {

                      final File imagefile = File(f!.path);
                      seletedImagespath = imagefile.path;
                    });
                  },

                  child: const Text("Open Gallery")),

              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                  onPressed: () async {
                    final XFile? f =
                    await picker.pickImage(source: ImageSource.camera);
                    setState(()  {

                      final File imagefile = File(f!.path);
                      seletedImagespath = imagefile.path;
                    });
                  },

                  child: const Text("Take a selfie")),

              const SizedBox(
                height: 20,
              ),

              ElevatedButton(onPressed: ()async{

                final XFile? f = await picker.pickImage(source: ImageSource.camera);
                setState(() {
                  final File imagefile = File(f!.path);
                  seletedImagespath = imagefile.path;
                });
              },
                  child: const Text("open file")),

              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MultipleImageSelector(),));
              }, child: Text("Next screen")),





            ]),

      ),
    );
  }
}
