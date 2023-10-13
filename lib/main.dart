import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Temperature Convertor",
      home: Myscreen(),
    );
  }
}

class Myscreen extends StatefulWidget {
  const Myscreen({super.key});

  @override
  State<Myscreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Myscreen> {
  double inTemp = 0.0, outtemp = 0.0;
  bool isfahr = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Temperature",
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 80),
              child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter the temperature",
                    labelText: isfahr
                        ? "you entered in $inTemp in Fahrenhit"
                        : "you entered in $inTemp in Celcius",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 20),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (newValue) {
                    setState(() {
                      try {
                        inTemp = double.parse(newValue);
                      } catch (e) {}
                    });
                  }),
            ),
            RadioListTile(
              value: true,
              groupValue: isfahr,
              onChanged: (newvalue) {
                setState(() {
                  isfahr = true;
                });
              },
              title: Text('fahrenhit'),
            ),
            RadioListTile(
              value: false,
              groupValue: isfahr,
              onChanged: (newvalue) {
                setState(() {
                  isfahr = false;
                });
              },
              title: Text('Celsius'),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    outtemp = isfahr
                        ? (inTemp - 32) / (5 / 6)
                        : (inTemp * 9 / 5) + 32;
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            title: Text("This is Result"),
                            content: isfahr
                                ? Text('$inTemp Fah = $outtemp celsius')
                                : Text('$inTemp Celsius = $outtemp Fah')));
                  });
                },
                child: Text(
                  "Convert",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ));
  }
}
