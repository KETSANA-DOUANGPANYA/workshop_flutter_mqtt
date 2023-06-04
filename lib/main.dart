import 'package:app_mqtt_whorkshop/screens/HomeScreen.dart';
import 'package:app_mqtt_whorkshop/service/mqtt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GetDataMqttProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter App",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
      ),
    );
  }
}
