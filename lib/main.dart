import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new PostHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cancer Prediction"),
        ),
        body: Bodypage(),
      ),
    );
  }
}

class Bodypage extends StatefulWidget {
  const Bodypage({super.key});

  @override
  State<Bodypage> createState() => _BodypageState();
}

class _BodypageState extends State<Bodypage> {
  TextEditingController age = TextEditingController();
  TextEditingController menopasuse = TextEditingController();
  TextEditingController turmorsize = TextEditingController();
  TextEditingController invnodes = TextEditingController();
  TextEditingController nodecaps = TextEditingController();
  TextEditingController degmalig = TextEditingController();
  TextEditingController breast = TextEditingController();
  TextEditingController breastquad = TextEditingController();
  TextEditingController irradiat = TextEditingController();

  String result = 'hello';
  bool flag = false;
  // List l = [];
  Future submit() async {
    var url =
        "https://noor237.pythonanywhere.com/${age.text}/${menopasuse.text}/${turmorsize.text}/${invnodes.text}/${nodecaps.text}/${degmalig.text}/${breast.text}/${breastquad.text}/${irradiat.text}";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      print(responseData);
      print(responseData['result'].runtimeType);

      result = responseData['result'];
      print('future function $result');

      // l = json.decode(response.body);
      flag = true;

      setState(() {});

      print(flag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextField(
            controller: age,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.purple)),
              // hintText: 'Age',
              labelText: 'Age',
              labelStyle: TextStyle(fontSize: 20),
            ),
            // cursorColor: Colors.black,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            // controller: controller,
            controller: menopasuse,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 223, 0, 252))),
              labelText: 'Menopause',
              labelStyle: TextStyle(fontSize: 20),
            ),
            // cursorColor: Colors.black,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            // controller: controller,
            controller: turmorsize,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 223, 0, 252))),
              labelText: 'Tumor-size',
              labelStyle: TextStyle(fontSize: 20),
            ),
            // cursorColor: Colors.black,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            // controller: controller,
            controller: invnodes,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 223, 0, 252))),
              labelText: 'Inv-Nodes',
              labelStyle: TextStyle(fontSize: 20),
            ),
            // cursorColor: Colors.black,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            // controller: controller,
            controller: nodecaps,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 223, 0, 252))),
              labelText: 'Node-Caps',
              labelStyle: TextStyle(fontSize: 20),
            ),
            // cursorColor: Colors.black,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            // controller: controller,
            controller: degmalig,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 223, 0, 252))),
              labelText: 'Deg-Malig',
              labelStyle: TextStyle(fontSize: 20),
            ),
            // cursorColor: Colors.black,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            // controller: controller,
            controller: breast,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 223, 0, 252))),
              labelText: 'Breast',
              labelStyle: TextStyle(fontSize: 20),
            ),
            // cursorColor: Colors.black,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            // controller: controller,
            controller: breastquad,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 223, 0, 252))),
              labelText: 'Breast-quad',
              labelStyle: TextStyle(fontSize: 20),
            ),
            // cursorColor: Colors.black,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            // controller: controller,
            controller: irradiat,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 223, 0, 252))),
              labelText: 'Irradiat',
              labelStyle: TextStyle(fontSize: 20),
            ),
            // cursorColor: Colors.black,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 30,
          ),
          Builder(
            builder: (context) => ElevatedButton(
                onPressed: () async {
                  await submit();

                  if (flag) {
                    final snackBar = SnackBar(
                      duration: Duration(seconds: 3),
                      margin: EdgeInsets.all(20),
                      behavior: SnackBarBehavior.floating,
                      elevation: 100,
                      backgroundColor: Color.fromARGB(255, 53, 50, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      content: Text(
                        'Output : $result',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }

                  age.clear();
                  menopasuse.clear();
                  turmorsize.clear();
                  invnodes.clear();
                  nodecaps.clear();
                  degmalig.clear();
                  breast.clear();
                  breastquad.clear();
                  irradiat.clear();
                },
                child: Text(
                  'Submit',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )),
          ),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
