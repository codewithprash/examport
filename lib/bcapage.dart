import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Bca extends StatefulWidget {
  const Bca({Key? key}) : super(key: key);

  @override
  State<Bca> createState() => _BcaState();
}

class _BcaState extends State<Bca> {
  final course = [
    'BCAI',
    'BCAII',
    'BCAIII',
    'BCAIV',
    'BCAV',
    'BCAVI',
  ];
  final year = [
    'DEC 2019, MAY 2020',
    'DEC 2020, MAY 2021',
    'DEC 2021, MAY 2022',
  ];

  String? bca;
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
                  value: bca,
                  isExpanded: true,
                  items: year.map(buildMenuyear).toList(),
                  onChanged: (value) => setState(() => bca = value),
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

                  if (bca == 'DEC 2019, MAY 2020') {
                    ses = '1920';
                  } else if (bca == 'DEC 2020, MAY 2021') {
                    ses = '2021';
                  } else if (bca == 'DEC 2021, MAY 2022') {
                    ses = '2122';
                  }

                  if (sem == 'BCAII') {
                    i = '_501_SEM_';
                  } else if (sem == 'BCAIV') {
                    i = '_SEM_501_';
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
