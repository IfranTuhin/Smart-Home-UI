import 'dart:math';

import 'package:flutter/material.dart';

class SmartDevicesBox extends StatelessWidget {
  final String devicesName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChange;

  SmartDevicesBox({
    super.key,
    required this.devicesName,
    required this.iconPath,
    required this.powerOn,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[800] : Colors.grey[00],
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // icon
            Image.asset(
              iconPath,
              height: 60,
              color: powerOn ? Colors.white : Colors.black,
            ),

            // devices name + switch
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    devicesName,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: powerOn ? Colors.white : Colors.black),
                  ),
                )),
                Transform.rotate(
                  angle: pi / 2,
                  child: Switch(
                    value: powerOn,
                    onChanged: onChange,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
