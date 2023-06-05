// import 'dart:convert';
// import 'dart:io';

// import 'package:cool_alert/cool_alert.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:laporan/home_page.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
// import 'package:http/http.dart' as http;

// class Camera extends StatefulWidget {
//   const Camera({Key? key}) : super(key: key);

//   @override
//   State<Camera> createState() => _CameraState();
// }

// class _CameraState extends State<Camera> {
//   int _index = 0;
//   TextEditingController input1 = TextEditingController();
//   TextEditingController input2 = TextEditingController();
//   List<GlobalKey<FormState>> formKeys = [
//     GlobalKey<FormState>(),
//     GlobalKey<FormState>(),
//   ];

//   File? _image;

//   Future<void> getImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;

//       final imagePermanent = await saveFilePermanently(image.path);

//       setState(() {
//         _image = imagePermanent;
//       });
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

//   Future<File> saveFilePermanently(String imagePath) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final name = basename(imagePath);
//     final image = File('${directory.path}/$name');

//     return File(imagePath).copy(image.path);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         title: const Text('LAPORAN'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: 40),
//               _image != null
//                   ? Image.file(
//                       _image!,
//                       width: 100,
//                       height: 100,
//                       fit: BoxFit.cover,
//                     )
//                   : Image.asset('assets/images/camera.png', width: 100),
//               SizedBox(height: 40),
//               CustomButton(
//                   title: 'Gallery',
//                   icon: Icons.image_outlined,
//                   onClick: () => getImage(ImageSource.gallery)),
//               SizedBox(height: 10),
//               CustomButton(
//                   title: 'Camera',
//                   icon: Icons.camera,
//                   onClick: () => getImage(ImageSource.camera)),
//               SizedBox(height: 20),
//               Container(
//                 padding: EdgeInsets.only(top: 50, left: 15),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.add_location_alt),
//                     Text('Location'),
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(20),
//                 child: Form(
//                   key: formKeys[0],
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: input1,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "Text harus di isi";
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'Location',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(Icons.description),
//                   Text('Description'),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Container(
//                 margin: EdgeInsets.all(20),
//                 child: Column(
//                   key: formKeys[1],
//                   children: [
//                     TextFormField(
//                       controller: input2,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Text harus di isi";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Description',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 100),
//               Container(
//                 margin: EdgeInsets.all(20),
//                 width: MediaQuery.of(context).size.width * 0.2,
//                 child: TextButton(
//                   onPressed: () => sendLaporan(context),
//                   style: TextButton.styleFrom(
//                     backgroundColor: Colors.green.shade600,
//                   ),
//                   child: const Text(
//                     'Submit',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> sendLaporan(BuildContext context) async {
//     if (!formKeys[_index].currentState!.validate()) {
//       CoolAlert.show(
//         context: context,
//         type: CoolAlertType.error,
//         text: "Validasi Error",
//       );
//     } else {
//       final location = input1.text;
//       final description = input2.text;
//       final imageFile = _image;

//       if (imageFile != null) {
//         final imageBytes = await imageFile.readAsBytes();
//         final base64Image = base64Encode(imageBytes);

//         final url = 'http://127.0.0.1:8000/api/laporan';
//         final headers = {'Content-Type': 'application/json'};
//         final body = jsonEncode({
//           'lokasi': location,
//           'deskripsi': description,
//           'image': base64Image,
//         });

//         final response = await http.post(Uri.parse(url),
//             headers: headers, body: body);

//         if (response.statusCode == 200) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => HomePage(),
//             ),
//           );
//         } else {
//           CoolAlert.show(
//             context: context,
//             type: CoolAlertType.error,
//             text: "Gagal mengirim laporan",
//           );
//         }
//       } else {
//         CoolAlert.show(
//           context: context,
//           type: CoolAlertType.error,
//           text: "Gambar belum dipilih",
//         );
//       }
//     }
//   }
// }

// class LaporanPage extends StatelessWidget {
//   final String apiUrl = 'http://127.0.0.1:8000/api/laporan/';

//   @override
//   Widget build(BuildContext context) {
//     String image = '';
//     String location = '';
//     String description = '';

//     void sendLaporan() async {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         body: {
//           'image': image,
//           'location': location,
//           'description': description,
//         },
//       );

//       if (response.statusCode == 200) {
//         CoolAlert.show(
//           context: context,
//           type: CoolAlertType.success,
//           text: "Laporan sent",
//         );
//       } else {
//         CoolAlert.show(
//           context: context,
//           type: CoolAlertType.error,
//           text: "Failed to send laporan",
//         );
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         title: const Text('LAPORAN'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.only(top: 50, right: 15),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(Icons.image),
//                   Text('Image'),
//                 ],
//               ),
//             ),
//             GestureDetector(
//               onTap: () async {
//                 final result = await Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Camera()),
//                 );
//                 if (result != null && result is String) {
//                   image = result;
//                 }
//               },
//               child: Container(
//                 padding: const EdgeInsets.only(right: 10),
//                 height: 40,
//                 child: Row(
//                   children: [
//                     const Text('  Input Image', textAlign: TextAlign.center),
//                   ],
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.0),
//                   border: Border.all(color: Colors.grey, width: 1.0),
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(top: 50, left: 15),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(Icons.add_location_alt),
//                   Text('Location'),
//                 ],
//               ),
//             ),
//             Container(
//               child: TextField(
//                 onChanged: (value) {
//                   location = value;
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Location",
//                   labelText: "Location",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(top: 50, left: 15),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text('Description'),
//                 ],
//               ),
//             ),
//             Container(
//               height: 100,
//               child: TextField(
//                 onChanged: (value) {
//                   description = value;
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Description",
//                   labelText: "Description",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.2,
//               child: TextButton(
//                 onPressed: () {
//                   sendLaporan();
//                 },
//                 style: TextButton.styleFrom(backgroundColor: Colors.green.shade600),
//                 child: const Text(
//                   'Submit',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomButton extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final VoidCallback onClick;

//   const CustomButton({
//     Key? key,
//     required this.title,
//     required this.icon,
//     required this.onClick,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextButton.icon(
//       onPressed: onClick,
//       icon: Icon(icon),
//       label: Text(title),
//     );
//   }
// }
