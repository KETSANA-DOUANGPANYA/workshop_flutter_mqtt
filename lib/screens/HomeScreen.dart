import 'package:app_mqtt_whorkshop/controllers/publicDataMqtt.dart';
import 'package:app_mqtt_whorkshop/service/mqtt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool state = false;
  @override
  void initState() {
    super.initState();
    context.read<GetDataMqttProvider>().connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("App Mqtt IoT"),
        ),
        body: Center(
          child: Column(
            children: [
              Consumer<GetDataMqttProvider>(
                builder: (context, dataprovider, index) {
                  if (dataprovider.data.isEmpty) {
                    return const CircularProgressIndicator();
                  } else {
                    final data = dataprovider.data.last;
                    return Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          const Text("Humidity"),
                          Text(data.humidity.toString()),
                          const Text("Temperature"),
                          Text(data.temperature.toString()),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              Switch(
                // This bool value toggles the switch.
                value: state,
                activeColor: Colors.red,
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(
                    () {
                      state = value;
                      mqttPublish(
                          message: (state) ? true : false,
                          topic: "ceitiot/test/mqtt/bt");
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }
}
