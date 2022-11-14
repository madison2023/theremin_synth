import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Theremin/Synth"),
        backgroundColor: const Color.fromARGB(255, 155, 69, 170),
      ),
      body: Center(
        child: SleekCircularSlider(
          min: 0,
          max: 50,
          initialValue: 1,
          appearance: CircularSliderAppearance(
              infoProperties: InfoProperties(bottomLabelText: 'Volume')),
          onChange: (double value) {
            // callback providing a value while its being changed (with a pan gesture)
          },
          onChangeStart: (double startValue) {
            // callback providing a starting value (when a pan gesture starts)
          },
          onChangeEnd: (double endValue) {
            // ucallback providing an ending value (when a pan gesture ends)
          },
        ),
      ),
    );
  }
}
