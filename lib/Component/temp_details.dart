import 'package:e_car_ui/Component/tem_btn.dart';
import 'package:flutter/material.dart';

import '../Constants/constanins.dart';
import '../Services/home_services.dart';

class TempDetils extends StatelessWidget {
  const TempDetils({
    Key? key,
    required HomeController hController,
  })  : _hController = hController,
        super(key: key);

  final HomeController _hController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TempBtn(
                  svgSrc: 'assets/icons/coolShape.svg',
                  isActive: _hController.isCoolselected,
                  press: () {
                    _hController.updateCoolSelected();
                  },
                  title: 'cool',
                ),
                const SizedBox(
                  width: defaultPadding,
                ),
                TempBtn(
                  svgSrc: 'assets/icons/heatShape.svg',
                  isActive: !_hController.isCoolselected,
                  press: () {
                    _hController.updateCoolSelected();
                  },
                  title: 'heat',
                  activeColor: redColor,
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_drop_up,
                  size: 50,
                ),
              ),
              Text(
                "29" "\u2103",
                style: TextStyle(fontSize: 86),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: 50,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            "current temperature".toUpperCase(),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "inside".toUpperCase(),
                    style: TextStyle(
                        color: _hController.isCoolselected
                            ? Colors.white
                            : Colors.white38),
                  ),
                  Text(
                    "20" "\u2103",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: _hController.isCoolselected
                            ? Colors.white
                            : Colors.white38),
                  ),
                ],
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Outside".toUpperCase(),
                    style: TextStyle(
                        color: !_hController.isCoolselected
                            ? Colors.white
                            : Colors.white38),
                  ),
                  Text(
                    "40" "\u2103",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: !_hController.isCoolselected
                            ? Colors.white
                            : Colors.white38),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
