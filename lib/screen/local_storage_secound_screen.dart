import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageSecondScreen extends StatefulWidget {
  const LocalStorageSecondScreen({Key? key}) : super(key: key);

  @override
  State<LocalStorageSecondScreen> createState() =>
      _LocalStorageSecondScreenState();
}

class _LocalStorageSecondScreenState extends State<LocalStorageSecondScreen> {
  SharedPreferences? sharedPreferences;
  int counter = 0;
  String name = "";
  List<String> appData = [];

  @override
  void initState() {
    // TODO: implement initState
    getInstanceData();

    super.initState();
  }

  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // getData();
  }

  getData() {
    if (sharedPreferences!.containsKey('counter')) {
      debugPrint("true");
      counter = sharedPreferences!.getInt('counter')!;
      name = sharedPreferences!.getString('name')!;
      appData = sharedPreferences!.getStringList('appData')!;
    } else {
      debugPrint("false");
      counter = 0;
      name = " ";
      appData = [];
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preference Second"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter: $counter",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Name: $name",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Name List: $appData",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getData();
        },
        heroTag: "get data second",
        child: const Icon(Icons.arrow_downward),
      ),
    );
  }
}
