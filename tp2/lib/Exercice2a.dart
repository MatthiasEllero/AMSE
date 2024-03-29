import 'package:flutter/material.dart';
import 'dart:math' as math;

class Exercice2a extends StatefulWidget {
  const Exercice2a({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Exercice2aState createState() => _Exercice2aState();
}

class _Exercice2aState extends State<Exercice2a> {
  double _rotationX = 0;
  double _rotationZ = 0;
  double _scale = 1;
  bool _isMirrored = false;

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
    );
  }

  Widget sliderWithLabel(String label, double value, double min, double max,
      Function(double) onChanged, double conversionFactor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label),
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
    );
  }
}
