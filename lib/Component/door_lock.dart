import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/constanins.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({
    Key? key,
    required this.IsLock,
    required this.press,
  }) : super(key: key);

  final VoidCallback press;
  final bool IsLock;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: AnimatedSwitcher(
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        duration: defaultDuration,
        switchInCurve: Curves.bounceInOut,
        child: IsLock
            ? SvgPicture.asset(
                "assets/icons/door_lock.svg",
                key: const ValueKey("lock"),
              )
            : SvgPicture.asset(
                "assets/icons/door_unlock.svg",
                key: const ValueKey("unlock"),
              ),
      ),
    );
  }
}
