import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class KalkulatorScreen extends StatefulWidget {
  const KalkulatorScreen({super.key});

  @override
  State<KalkulatorScreen> createState() => _KalkulatorScreenState();
}

class _KalkulatorScreenState extends State<KalkulatorScreen> {
  String _input = '';
  String _output = '';

  void _buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _output = '';
      } else if (value == '=') {
        if (_input.isEmpty) return;

        try {
          // Replace operators jika perlu
          String expression = _input.replaceAll('×', '*').replaceAll('÷', '/');

          GrammarParser p = GrammarParser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          double result = exp.evaluate(EvaluationType.REAL, cm);

          // Format output agar lebih rapi
          if (result == result.toInt()) {
            _output = result.toInt().toString();
          } else {
            _output = result
                .toStringAsFixed(8)
                .replaceAll(RegExp(r'0+$'), '')
                .replaceAll(RegExp(r'\.$'), '');
          }
        } catch (e) {
          _output = 'Error';
        }
      } else if (value == '⌫') {
        // Tombol backspace
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
        }
      } else {
        _input += value;
      }
    });
  }

  Widget _buildButton(
    String text, {
    bool isOp = false,
    bool isSpecial = false,
  }) {
    return ElevatedButton(
      onPressed: () => _buttonPressed(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSpecial
            ? Colors.orange
            : (isOp ? Colors.blueAccent : Colors.grey[300]),
        foregroundColor: (isOp || isSpecial) ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(20),
        elevation: 2,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Display area
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        _input.isEmpty ? '0' : _input,
                        style: TextStyle(fontSize: 28, color: Colors.grey[700]),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        _output,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Buttons
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildButton('C', isSpecial: true),
                    _buildButton('⌫', isOp: true),
                    _buildButton('%', isOp: true),
                    _buildButton('/', isOp: true),
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('*', isOp: true),
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('-', isOp: true),
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('+', isOp: true),
                    _buildButton('.'),
                    _buildButton('0'),
                    _buildButton('00'),
                    _buildButton('=', isSpecial: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
