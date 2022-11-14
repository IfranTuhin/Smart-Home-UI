import 'package:flutter/material.dart';
import 'package:smart_home_ui/utils/smart_devices_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // padding constant
  final double horizontalPadding = 30;
  final double varticalPadding = 20;

  // list of smart devices
  List smartDevices = [
    //  [smart devices name, icon path, power status]
    ["Smart Light", "lib/icons/lightbulb.png", true],
    ["Smart AC", "lib/icons/ac.png", false],
    ["Smart TV", "lib/icons/smart_tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
  ];

  // power switch chenge
  void powerSwitchChenge(bool value, int index) {
    setState(() {
      smartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // body
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: varticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icon
                  Image.asset(
                    "lib/icons/menu.png",
                    height: 45,
                    color: Colors.grey[800],
                  ),

                  // acount icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // welcome home Ifran Tuhin
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Welcome Home"),
                  Text(
                    "Ifran Tuhin",
                    style: TextStyle(fontSize: 38),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // smart devices + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text("Smart Devices"),
            ),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(20),
                itemCount: smartDevices.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.2,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return SmartDevicesBox(
                    devicesName: smartDevices[index][0],
                    iconPath: smartDevices[index][1],
                    powerOn: smartDevices[index][2],
                    onChange: (value) => powerSwitchChenge(value, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
