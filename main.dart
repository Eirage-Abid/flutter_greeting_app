import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Main funtion or entry point
void main() {
  runApp(greetingCard());
}

// From here our greeting card begins
class greetingCard extends StatefulWidget {
  const greetingCard({super.key});


  @override
  State<greetingCard> createState() => _greetingCardState();
}

class _greetingCardState extends State<greetingCard> {

  // A texteditingController to manipulate textfied input on run time
  TextEditingController _nameController=TextEditingController();
  String? username;

  @override
  Widget build(BuildContext context) {

    // raps the app, and Scaffold provides the basic layout structure with an AppBar and a body
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Icreativez greeting app"),
              centerTitle: true,
              backgroundColor: Colors.yellow,
            ),

            backgroundColor: Colors.black,

            //to allow scrolling if content overflows
            body: SingleChildScrollView(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        hintText: "Input your name",
                        hintStyle: TextStyle(color: Colors.yellow),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(20)
                        ),
                    ),
                    style: TextStyle(color: Colors.yellow), // Text color yellow
                  ),
              ),


                  // Space between TextField and greeting text
                  SizedBox(height: 60),


                  // Greeting text with white color for visibility
                  Text("Hello, $username" ?? "Greeting",
                      style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow)),


                  // Space before button
                  SizedBox(height:60),


              // Yellow button with black text
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        username = _nameController.text.toString();
                        if(username!.isEmpty){
                          Fluttertoast.showToast(
                            msg: "Please input the name!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white

                          );
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow),
                    child: Text(
                        "Show Greeting",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black)),
                  ),
                ],
              ),
            )
        )
    );
  }
}










































