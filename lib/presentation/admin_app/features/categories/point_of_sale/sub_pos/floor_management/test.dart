import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // This key will be associated with the amber box
  final GlobalKey _key = GlobalKey();

  // Coordinates
  double? _x, _y;

  // This function is called when the user presses the floating button
  void _getOffset(GlobalKey key) {
    RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    Offset? position = box?.localToGlobal(Offset.zero);
    if (position != null) {
      setState(() {
        _x = position.dx;
        _y = position.dy;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          Positioned(
            top: 70,
            left: 50,
            // The amber box
            child: Container(
              key: _key,
              width: 360,
              height: 200,
              padding: const EdgeInsets.all(30),
              color: Colors.amber,
              child: Text(
                _x != null
                    ? "X: $_x, \nY: $_y"
                    : 'Press the button to calculate',
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _getOffset(_key),
          child: const Icon(Icons.calculate)),
    );
  }
}