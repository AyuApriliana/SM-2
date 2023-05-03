import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.add_a_photo_rounded), label: "Add"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil")
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Container(
                //   height: 40, width: double.infinity, color: Colors.lightBlueAccent),
                Column(
                  children: [
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(15),
                    //   child: Row(
                    //     children: [
                    //       // Container(
                    //       //   alignment: Alignment.topLeft,
                    //       //   height: 45,
                    //       //   width: 45,
                    //       //   decoration: BoxDecoration(
                    //       //     image: DecorationImage(
                    //       //       image: NetworkImage("https://i.pinimg.com/474x/29/5f/75/295f75fb23b88497c4ad9884f2ac2419.jpg")),
                    //       //       borderRadius: BorderRadius.circular(25),
                    //       //       border: Border.all(
                    //       //         color: Colors.white,
                    //       //         style: BorderStyle.solid,
                    //       //         width: 2
                    //       //       ),
                    //       //   )
                    //       // ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 100),
                     Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "Beranda",
                          style: GoogleFonts.montserrat(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    SizedBox(
                      width: double.infinity,
                      height: 240,
                      child: Stack(
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                            elevation: 10,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 150,
                                  child: Image.asset(
                                      "assets/images/lubang1.jpeg",
                                      fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0, 
                            left: 10,
                            child: SizedBox(
                              height: 70,
                              child: Column(
                                children: [
                                  Text("Pabian - Sumenep",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 17, fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Icon(Icons.favorite, color: Colors.red),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("4.5k",
                                              style: 
                                                  GoogleFonts.montserrat(fontSize: 12)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                        ],)
                                ],
                              ),
                            )
                          ),
                        ],
                      ),
                    ),


                    SizedBox(
                      width: double.infinity,
                      height: 240,
                      child: Stack(
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                            elevation: 10,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 150,
                                  child: Image.asset(
                                      "assets/images/lubang2.jpeg",
                                      fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0, 
                            left: 10,
                            child: SizedBox(
                              height: 70,
                              child: Column(
                                children: [
                                  Text("Kertasada - Sumenep",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 17, fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Icon(Icons.favorite, color: Colors.red),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("2.7k",
                                              style: 
                                                  GoogleFonts.montserrat(fontSize: 12)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                        ],)
                                ],
                              ),
                            )
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 240,
                      child: Stack(
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                            elevation: 10,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 150,
                                  child: Image.asset(
                                      "assets/images/lubang3.jpg",
                                      fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0, 
                            left: 10,
                            child: SizedBox(
                              height: 70,
                              child: Column(
                                children: [
                                  Text("Bangselok - Sumenep",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 17, fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Icon(Icons.favorite, color: Colors.red),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("1k",
                                              style: 
                                                  GoogleFonts.montserrat(fontSize: 12)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                        ],)
                                ],
                              ),
                            )
                          ),
                        ],
                      ),
                    ),



                    SizedBox(
                      width: double.infinity,
                      height: 240,
                      child: Stack(
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                            elevation: 10,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 150,
                                  child: Image.asset(
                                      "assets/images/lubang4.jpeg",
                                      fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0, 
                            left: 10,
                            child: SizedBox(
                              height: 70,
                              child: Column(
                                children: [
                                  Text("Kalianget - Sumenep",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 17, fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Icon(Icons.favorite, color: Colors.red),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("100",
                                              style: 
                                                  GoogleFonts.montserrat(fontSize: 12)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                        ],)
                                ],
                              ),
                            )
                          ),
                        ],
                      ),
                    ),



                    SizedBox(
                      width: double.infinity,
                      height: 240,
                      child: Stack(
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                            elevation: 10,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 150,
                                  child: Image.asset(
                                      "assets/images/lubang5.jpg",
                                      fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0, 
                            left: 10,
                            child: SizedBox(
                              height: 70,
                              child: Column(
                                children: [
                                  Text("Marengan - Sumenep",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 17, fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Icon(Icons.favorite, color: Colors.red),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("500",
                                              style: 
                                                  GoogleFonts.montserrat(fontSize: 12)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                        ],)
                                ],
                              ),
                            )
                          ),
                        ],
                      ),
                    ),



                    SizedBox(
                      width: double.infinity,
                      height: 240,
                      child: Stack(
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                            elevation: 10,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 150,
                                  child: Image.asset(
                                      "assets/images/lubang6.jpeg",
                                      fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0, 
                            left: 10,
                            child: SizedBox(
                              height: 70,
                              child: Column(
                                children: [
                                  Text("Kebunan - Sumenep",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 17, fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Icon(Icons.favorite, color: Colors.red),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("10k",
                                              style: 
                                                  GoogleFonts.montserrat(fontSize: 12)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                        ],)
                                ],
                              ),
                            )
                          ),
                        ],
                      ),
                    ),

                  ],
                )
              ],
            )
          ],
        )
      ),
    );
  }
}