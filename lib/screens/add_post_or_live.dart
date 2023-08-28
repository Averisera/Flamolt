import 'dart:typed_data';

import 'package:flamolt/components/firestore_methods.dart';
import 'package:flamolt/components/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';
import 'package:dotted_border/dotted_border.dart';

class AddPostOrLiveScreen extends StatefulWidget {
  const AddPostOrLiveScreen({super.key});

  @override
  State<AddPostOrLiveScreen> createState() => _AddPostOrLiveScreenState();
}

class _AddPostOrLiveScreenState extends State<AddPostOrLiveScreen> {
  final TextEditingController _titleController= TextEditingController();
  Uint8List? _file;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
  }
  void goLiveStream() async {
    String channelId= await FirestoreMethods().startLiveStream(_titleController.text, _file, context);
    if(channelId.isNotEmpty){
      Navigator.of(context).pushNamed('/addlive');
    }
  }
  @override
  Widget build(BuildContext context) {
    
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back),backgroundColor: const Color.fromARGB(255, 38, 38, 41),),
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.kBlackColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight*0.04,),
            _file==null? Center(
              child: GestureDetector(
                onTap: () async {
                  var file= await pickImage(ImageSource.gallery);
                  setState(() {
                    _file=file;
                  });
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10,4],
                  strokeCap: StrokeCap.round,
                  color: Constants.kWhiteColor,
                  child: Container(
                    height: screenHeight*0.3, width: screenWidth*0.85, color: Constants.kWhiteColor.withOpacity(0.03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.folder_open, color: Constants.kWhiteColor,),
                        const Text('Add Thumbnail', style: TextStyle(color: Constants.kGreyColor, fontSize: 17),)
                      ],
                    ),
                  ),
                ),
              ),
            ): SizedBox(height: screenHeight*0.3, width: screenWidth*0.85, child: Image.memory(_file!),),
            SizedBox(height: screenHeight*0.03,),
            Container(
              width: screenWidth*0.9, height: screenHeight*0.15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Title', style: TextStyle(color: Constants.kWhiteColor, fontWeight: FontWeight.bold, fontSize: 18),),
                  const SizedBox(height: 3,),
                  TextField(
                    style: TextStyle(color: Constants.kWhiteColor, fontSize: 20),
                    controller: _titleController,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Constants.kWhiteColor,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Constants.kGreyColor,
                        )
                      )
                    ),
                  ),
                  
                ],
              ),
            ),
            const Spacer(),
            // SizedBox(height: screenHeight*0.2,),
            Container(color: Constants.kWhiteColor, width: screenWidth*0.9, height: screenHeight*0.09,
              child: TextButton(
                onPressed: (){goLiveStream();}, 
                child: const Text('Go Live!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              )
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,)
          ],
        ),
      ),
    );
  }
  
  
}