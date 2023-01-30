import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_secound_screen.dart';

class SharedPreferencesScreen extends StatefulWidget {
  const SharedPreferencesScreen({Key? key}) : super(key: key);

  @override
  State<SharedPreferencesScreen> createState() =>
      _SharedPreferencesScreenState();
}

class _SharedPreferencesScreenState extends State<SharedPreferencesScreen> {
  SharedPreferences? sharedPreferences;
  int counter = 0;
  String name = " ";
  List<String> appData = [];

  @override
  void initState() {
    // TODO: implement initState
    getInstanceData();
    super.initState();
  }

  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    getData();
  }

  setData() async {
    await sharedPreferences!.setInt('counter', 10);
    await sharedPreferences!.setString('name', "Nikunj");
    await sharedPreferences!.setStringList('appData', ["Keyur", "Sachin"]);
  }

  getData() {
    if (sharedPreferences!.containsKey('counter')) {
      debugPrint('true');
      counter = sharedPreferences!.getInt('counter')!;
      name = sharedPreferences!.getString('name')!;
      appData = sharedPreferences!.getStringList('appData')!;
    } else {
      debugPrint('false');
      counter = 0;
      name = "";
      appData = [];
    }
    setState(() {});
  }

  removeData() {
    sharedPreferences!.remove('counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preference First Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "counter=:$counter",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Name=:$name",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Name List=:$appData",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LocalStorageSecondScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Next Screen",
                ))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "set data",
            onPressed: () {
              setData();
            },
            child: const Icon(Icons.arrow_upward),
          ),
          FloatingActionButton(
            heroTag: "get data",
            onPressed: () {
              getData();
            },
            child: const Icon(Icons.arrow_downward),
          ),
          FloatingActionButton(
            heroTag: "remove data",
            onPressed: () {
              removeData();
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
