import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laporan/image_form.dart';
import 'package:laporan/navbar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  int _index = 0;
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  
  final textController = TextEditingController();
  File? _image;
  
  

Future getImage(ImageSource source) async {
  try {
    final image = await ImagePicker().pickImage(source: source);
    if( image == null ) return;

    final imagePermanent = await saveFilePermanently(image.path);

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imagePermanent;
       });
  }on PlatformException catch (e){
    print('Failed to pick image : $e');
  }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');


    return File(imagePath).copy(image.path);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navbar(),
            appBar: AppBar(
        backgroundColor: Colors.blueAccent ,
        // leading: const Icon(Icons.menu),
        title: const Text('LAPORAN'),
        centerTitle: true,
      ),
      body: Center( 
        child: Column(
        children: [
          SizedBox(height: 40),
          _image !=null ? Image.file(_image!,
          width: 50,
          height: 50,
          fit: BoxFit.cover,)
          : Image.asset('assets/images/camera.png', width: 100),
          SizedBox(height: 40),
          CustomButton(
            title:'Galery', 
            icon: Icons.image_outlined, 
            onClick : () => getImage(ImageSource.gallery)),
          SizedBox(height: 10),
          CustomButton(
            title:'Camera', 
            icon: Icons.camera, 
            onClick : () => getImage(ImageSource.camera)),
          
            Column(
          children: <Widget>[ 
            Container(
              padding: EdgeInsets.only(top: 50, left: 15),
              child: 
                 Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon( Icons.add_location_alt,),
                    Text('Location'),
                  ]
                ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Form(
                key: formKeys[0],
                child: Column(
                  children : [TextFormField(
                     controller: input1,
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return "Text harus di isi";
                        }return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Location')
                      ),
                  ),
          ]),
                ),
                      ),
        ]),
        SizedBox(height: 20),
                  Row(
                     mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon( Icons.description),
                    Text('Description'),
                  ]
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.all(20),
                child: Column(
                  key: formKeys[1],
                  children : [TextFormField(
                     controller: input2,
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return "Text harus di isi";
                        }return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Description')
                      ),
                  ),
                  
                  ]
                ),
                      ),
           
            Container(
             
            ),
            SizedBox(height: 100),
            Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.2,
              child: TextButton(
                onPressed: () {
                  if(!formKeys[_index].currentState!.validate()){
                    CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    text: " Validasi Eror",
                  );
                            }else {
                              print('validation eror');
                            } 
                  
                },
                
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green.shade600),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

          ],
        ),
            )
      
      );
  }
}
Widget CustomButton(
  {required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 300 ,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(
        children: [
      Icon(icon),
      SizedBox(width: 28),
      Text(title),
    ]),),
  );
}

Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[ 
            Container(
              padding: EdgeInsets.only(top: 50, left: 15),
              child: 
                 Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon( Icons.add_location_alt,),
                    Text('Location'),
                  ]
                ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Location",
                  labelText: "Location",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ), 
            Container(
              padding: EdgeInsets.only(top: 50, left: 15),
              child: 
                 Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Description'),
                  ]
              ),
            ),
            Container(
              height: 100,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Description",
                  labelText: "Description",                        
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),                          
                  ),
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: TextButton(
                onPressed: () {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    text: "Laporan berhasil dikirim",
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green.shade600),
                child: const Text(
                  'Send',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

          ],
        ),
      ), 
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.add_a_photo_rounded), label: "Add"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil")
      ]),
    );                      
  }
  
