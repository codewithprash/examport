import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Bba extends StatefulWidget {
  const Bba({Key? key}) : super(key: key);

  @override
  State<Bba> createState() => _BbaState();
}

class _BbaState extends State<Bba> {
  final course = ['BBAI', 'BBAII', 'BBAIII', 'BBAIV', 'BBAV', 'BBAVI'];
  final year = [
    'DEC 2019, MAY 2020',
    'DEC 2020, MAY 2021',
    'DEC 2021, MAY 2022',
  ];

  String? bba;
  String? sem;
  String? i;
  String? ses;
  final TextEditingController _roll = TextEditingController();
  DropdownMenuItem<String> buildMenucourse(String course) => DropdownMenuItem(
        value: course,
        child: Text(course),
      );

  DropdownMenuItem<String> buildMenuyear(String year) => DropdownMenuItem(
        value: year,
        child: Text(
          year,
          style: const TextStyle(fontSize: 18),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'EXAMPORT',
      //     style: TextStyle(
      //         color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                child: Image(image: AssetImage('images/icon.png')),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('SESSION'),
              Container(
                decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(10)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: DropdownButton<String>(
                  iconEnabledColor: Colors.orange,
                  dropdownColor: Colors.orange.shade100,
                  hint: const Text('Select Session'),
                  value: bba,
                  isExpanded: true,
                  items: year.map(buildMenuyear).toList(),
                  onChanged: (value) => setState(() => bba = value),
                ),
              ),
              const Text('SEMESTER'),
              Container(
                decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(10)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: DropdownButton<String>(
                  iconEnabledColor: Colors.orange,
                  dropdownColor: Colors.orange.shade100,
                  hint: const Text('Select Semester'),
                  value: sem,
                  isExpanded: true,
                  items: course.map(buildMenucourse).toList(),
                  onChanged: (value) => setState(() => sem = value),
                ),
              ),
              const Text('ROLL NUMBER'),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: _roll,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(
                        Icons.numbers_rounded,
                      ),
                      hintText: 'Enter Roll Number',
                      fillColor: Colors.orange.shade100,
                      filled: true),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  //setState(() => can = '$bca$i$sem');
                  if (bba == 'DEC 2019, MAY 2020') {
                    ses = '1920';
                  } else if (bba == 'DEC 2020, MAY 2021') {
                    ses = '2021';
                  } else if (bba == 'DEC 2021, MAY 2022') {
                    ses = '2122';
                  }
                  if (sem == 'BBAII') {
                    i = '_SEM_507_';
                  } else if (sem == 'BBAIV') {
                    i = '_SEM_507_';
                  } else {
                    i = '_SEM_';
                  }
                  String note = '$sem$i$ses';
                  String rollnum = _roll.text.trim();

                  String url =
                      'https://result.dbrauonlineservices.in/ResultDisp$note.aspx?rl=$rollnum';

                  if (await canLaunchUrlString(url)) {
                    await launchUrlString(url);
                  }
                },
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      'Show result',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
