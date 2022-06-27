// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({
    Key? key,
    required this.constraints,
  }) : super(key: key);
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "220 mi",
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        ),
        Text(
          "64%",
          style: TextStyle(fontSize: 24),
        ),
        Spacer(),
        Text(
          "charging".toUpperCase(),
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "30 min remaining",
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.14,
        ),
        DefaultTextStyle(
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text('33 mi/hr'), Text("250 v")],
            ),
          ),
        )
      ],
    );
  }
}
