import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var note;

  final ref = FirebaseDatabase.instance.ref().child('notes/data');

  String getLetterNote(Object? midiNote) {
    switch (midiNote) {
      case 60:
        {
          return "C4";
        }
      case 61:
        {
          return "C#4/Db4";
        }
      case 62:
        {
          return "D4";
        }
      case 63:
        {
          return "D#4/Eb4";
        }
      case 64:
        {
          return "E4";
        }
      case 65:
        {
          return "F4";
        }
      case 66:
        {
          return "F#4/Gb4";
        }
      case 67:
        {
          return "G4";
        }
      case 68:
        {
          return "G#4/Ab4";
        }
      case 69:
        {
          return "A4";
        }
      case 70:
        {
          return "A#4/Bb4";
        }
      case 71:
        {
          return "B4";
        }
      case 72:
        {
          return "C5";
        }
      default:
        {
          return "Out of Range";
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theremin"),
        backgroundColor: const Color.fromARGB(255, 155, 69, 170),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Note", style: TextStyle(fontSize: 40)),
            StreamBuilder(
              stream: ref
                  .onValue, //triggers whenever the data is updated in the database
              builder: ((context, snapshot) {
                if (snapshot.hasData &&
                    !snapshot.hasError &&
                    snapshot.data?.snapshot.value != null) {
                  return Text(
                    getLetterNote(snapshot.data!.snapshot.value),
                    style: const TextStyle(fontSize: 50),
                  );
                }
                return const CircularProgressIndicator();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
