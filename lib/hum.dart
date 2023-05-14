import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Hum extends StatefulWidget {
  const Hum({super.key});

  @override
  State<Hum> createState() => _HumState();
}

class _HumState extends State<Hum> {
  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref();

  String key1Value = '';
  String key2Value = '';

  @override
  void initState() {
    super.initState();
    final DatabaseReference nodeReference = databaseReference.child('/ESP32_APP');
    final DatabaseReference key1Reference = nodeReference.child('/TEMPERATURE');
    final DatabaseReference key2Reference = nodeReference.child('/HUMIDITY');
    key1Reference.onValue.listen((event) {
      setState(() {
        key1Value = event.snapshot.value.toString();
      });
    });
    key2Reference.onValue.listen((event) {
      setState(() {
        key2Value = event.snapshot.value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realtime Database Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Value of "key1": $key1Value'),
            const SizedBox(height: 20),
            Text('Value of "key2": $key2Value'),
          ],
        ),
      ),
    );
  }
}
