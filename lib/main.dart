import 'package:examport/bbapage.dart';
import 'package:examport/bcapage.dart';
import 'package:examport/bscbio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Examport',
        theme: ThemeData(
            primaryColor: Colors.orange,
            primarySwatch: Colors.orange,
            brightness: Brightness.light),
        home: const Dashboard());
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                child: Image(image: AssetImage('images/icon.png')),
              ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Bca()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text(
                    'BCA',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Bba()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text(
                    'BBA',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Bscbiotech()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Text(
                    'BSC biotech',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
