import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent.shade400),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'yourBMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var inccontroller = TextEditingController();
  String result = '';
  var bgcolor;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 21),
                TextField(
                  controller: wtcontroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.line_weight),
                    label: Text("Enter your Weight"),
                  ),
                ),
                const SizedBox(height: 21),
                TextField(
                  controller: ftcontroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.height),
                    label: Text("Enter your height in feet"),
                  ),
                ),
                const SizedBox(height: 21),
                TextField(
                  controller: inccontroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.height),
                    label: Text("Enter your height in inches"),
                  ),
                ),
                const SizedBox(height: 21),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtcontroller.text.trim();
                    var ft = ftcontroller.text.trim();
                    var inc = inccontroller.text.trim();

                    if (wt.isNotEmpty && ft.isNotEmpty && inc.isNotEmpty) {
                      var iwt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inc);

                      var tInch = (iFt * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var Tm = tCm / 100;
                      var msg="";

                      var bmi = iwt / (Tm * Tm);
                      if(bmi>25)
                        {
                          msg="You're Overweight";
                          bgcolor=Colors.orange.shade500;
                        }
                      else if(bmi<18){
                        msg="You're Underweight";
                        bgcolor=Colors.red.shade500;
                      }
                      else{
                        msg="You're Healthy";
                        bgcolor=Colors.green.shade300;
                      }

                      setState(() {
                        result = "$msg \n Your BMI is ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = 'Please fill all the required blanks!!';
                      });
                    }
                  },
                  child: const Text('Calculate'),
                ),
                const SizedBox(height: 11),
                Text(
                  result,
                  style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}