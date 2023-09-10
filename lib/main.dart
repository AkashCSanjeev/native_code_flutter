import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Native Code Use'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MethodChannel channel = MethodChannel("toastChannel");
  String data = "None";

  showToast() async {
    print("showToast");
    data = await channel.invokeMethod("showToast");
    print("Data : " + data);
    setState(() {});
  }

  getData() async {
    print("getData");
    data = await channel.invokeMethod("getData");
    print("Data : " + data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: showToast,
              child: Text("Toast"),
            ),
            Text(data),
            ElevatedButton(
              onPressed: getData,
              child: Text("get data"),
            ),
          ],
        ),
      ),
    );
  }
}
