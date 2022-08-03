import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

void main() => runApp(const Microscope());

class Microscope extends StatefulWidget {
  const Microscope({Key? key}) : super(key: key);

  @override
  State<Microscope> createState() => _MicroscopeState();
}

class _MicroscopeState extends State<Microscope> {

  // image picker 需要的变量
  final picker = ImagePicker();
  XFile? _image;


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: _buildBody(),
    );
  }
  
  Widget _buildBody(){
    return Scaffold(
      appBar: AppBar(
        title: Text("这是个标题"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Expanded(flex: 1,child: Text("这是下面的标题",
          style: TextStyle(fontSize: 36, color: Colors.blueAccent),),),
          Expanded(flex: 5, child: Image.network("https://i.postimg.cc/c4tfXTW3/d43e2a6c1f2d23793b80d4a0aadcf57.png",
          fit: BoxFit.cover,)),

          Container(height: 50,),

          Expanded(flex: 1,child: ElevatedButton(onPressed: _photo,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.blue)),
              padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(70, 0, 70, 0)),
            ),
            child: const Text("Start a new session"),),),

          Container(height: 20,),

          Expanded(child: ElevatedButton(onPressed: (){},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.blue)),
              padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(100, 0, 100, 0)),
            ),
            child: const Text("Database"),)),

          Container(height: 10,)

        ],
      ),
    );
  }

  _photo() async {
    XFile? file = await picker.pickImage(source: ImageSource.camera,
        maxHeight: 600,
        maxWidth: 600);

    if (file != null)
      {
        setState(() {
          _image = file;
        });
      }
  }
}
