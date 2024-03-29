import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

class Exercice2b extends StatefulWidget {
  const Exercice2b({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Exercice2bState createState() => _Exercice2bState();
}

class _Exercice2bState extends State<Exercice2b> {
  double _rotationX = 0;
  double _rotationZ = 0;
  double _scale = 1;
  bool _isMirrored = false;
  Timer? _timer;
  bool _isAnimating = false;

  void startAnimation() {
    const duration = Duration(milliseconds: 50);
    _timer = Timer.periodic(duration, animate);
    _isAnimating = true;
  }

  void stopAnimation() {
    _timer?.cancel();
    _isAnimating = false;
  }

  void animate(Timer timer) {
    setState(() {
      _rotationX = (_rotationX + 0.02) % (math.pi);
      _rotationZ = (_rotationZ + 0.02) % (math.pi);
      _scale = 1 + 0.5 * math.sin(timer.tick / 20);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transformations d\'image'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(_rotationX)
                ..rotateZ(_rotationZ)
                ..scale(_isMirrored ? -_scale : _scale, _scale),
              alignment: FractionalOffset.center,
              child: Image.network(
                  'https://www.boutique-namaste.com/cdn/shop/articles/animal-totem-aigle_1600x.jpg?v=1670453691',
                  width: 200,
                  height: 200),
            ),
            sliderWithLabel("Rotation X", _rotationX, 0, math.pi, (val) {
              setState(() {
                _rotationX = val;
              });
            }, (180 / math.pi)),
            sliderWithLabel("Rotation Z", _rotationZ, 0, math.pi, (val) {
              setState(() {
                _rotationZ = val;
              });
            }, (180 / math.pi)),
            sliderWithLabel("Scale", _scale, 0.5, 2.0, (val) {
              setState(() {
                _scale = val;
              });
            }, 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Miroir"),
                Switch(
                  value: _isMirrored,
                  onChanged: (value) {
                    setState(() {
                      _isMirrored = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_isAnimating) {
            stopAnimation();
          } else {
            startAnimation();
          }
        },
        child: Icon(_isAnimating ? Icons.pause : Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget sliderWithLabel(String label, double value, double min, double max,
      Function(double) onChanged, double conversionFactor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$label: "),
          Expanded(
            child: Slider(
              value: value,
              min: min,
              max: max,
              divisions: 100,
              label: (value * conversionFactor).toStringAsFixed(2),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
