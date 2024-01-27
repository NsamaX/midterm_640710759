import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyAppStateful(),
    );
  }
}

class MyAppStateful extends StatefulWidget {
  const MyAppStateful({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppStateful> {
  String _output = "0";

  void _onPressed(String buttonText) {
    setState(() {
      if (buttonText == "C" || buttonText == "=") {
        _clearOutput();
      } else if (buttonText == "⌫") {
        _deleteCharacter();
      } else {
        _appendToOutput(buttonText);
      }
    });
  }

  void _clearOutput() {
    _output = "0";
  }

  void _deleteCharacter() {
    if (_output.length > 1) {
      _output = _output.substring(0, _output.length - 1);
    } else {
      _output = "0";
    }
  }

  void _appendToOutput(String text) {
    if (_output == "0") {
      if (_isOperator(text) == false) {
        _output = text;
      }
    } else {
      if (_isOperator(text) && _isOperator(_output[_output.length - 1])) {
        _output = _output.substring(0, _output.length - 1);
      }
      _output += text;
    }
  }

  bool _isOperator(String character) {
    return character == "+" ||
        character == "-" ||
        character == "×" ||
        character == "÷";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2.0, color: Color(0xFFEEEEEE)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back),
              Row(
                children: const [
                  Icon(
                    Icons.calculate,
                    color: Color(0xFF006A60),
                    size: 36.0,
                  ),
                  SizedBox(width: 10.0),
                  Text("MY CALCULATOR"),
                ],
              ),
              Icon(null),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        child: Text(
                          _output,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 60.0,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  _buildOperaterButton("C"),
                  _buildOperaterButton("⌫"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  _buildNumberButton("7"),
                  _buildNumberButton("8"),
                  _buildNumberButton("9"),
                  _buildOperaterButton("÷"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  _buildNumberButton("4"),
                  _buildNumberButton("5"),
                  _buildNumberButton("6"),
                  _buildOperaterButton("×"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  _buildNumberButton("1"),
                  _buildNumberButton("2"),
                  _buildNumberButton("3"),
                  _buildOperaterButton("-"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  _buildSpecailButton("0", Colors.black, Color(0xFF092F4E5), 3),
                  _buildOperaterButton("+"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  _buildSpecailButton("=", Colors.white, Color(0xFF006A60), 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberButton(String text) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 100,
          color: Color(0xFF092F4E5),
          child: TextButton(
            onPressed: () {
              _onPressed(text);
            },
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOperaterButton(String text) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 100,
          color: Color(0xFFEEEEEE),
          child: TextButton(
            onPressed: () {
              _onPressed(text);
            },
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpecailButton(
      String text, Color font_color, Color color, int flex) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 100,
          color: color,
          child: TextButton(
            onPressed: () {
              _onPressed(text);
            },
            child: Text(
              text,
              style: TextStyle(
                color: font_color,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
