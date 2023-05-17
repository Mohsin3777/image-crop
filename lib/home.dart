import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
        File? imageFile ;


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

      ),
      body: Column(

        children: [
          Container(
            height: 200,
     child:     imageFile !=null ?
Image.file(imageFile!):

Image.network('https://images.unsplash.com/photo-1684190709707-a5be73d0959f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60')

          ),

          ElevatedButton(onPressed: ()async{
           
              pickImage();
       
          }, child: Text('PICK'))
        ],
      ),
    );
  }
  void pickImage()async{
  final ImagePicker picker = ImagePicker();
// Pick an image.
final XFile? image = await picker.pickImage(source: ImageSource.gallery);

 if (image != null) {
      
                    File newImg = File(image.path);
   
   cropImage(newImg);
        
    }
}

cropImage(File imageFile1)async{
  CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile1.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
        

  
     
      ],

      
    );

    if(croppedFile !=null){
      print('uesssssssssssssssss');
       setState(() {
          imageFile = File(croppedFile.path);
          
        });
    }
}
}