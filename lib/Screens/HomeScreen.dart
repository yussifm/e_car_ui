// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:e_car_ui/Constants/constanins.dart';
import 'package:e_car_ui/Services/home_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Component/btr_status.dart';
import '../Component/car_bottom_navBar.dart';
import '../Component/door_lock.dart';
import '../Component/tem_btn.dart';
import '../Component/temp_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final HomeController _hController = HomeController();
  late AnimationController _btrAnimationController;
  late Animation<double> _animationBattery;
  late Animation<double> _btrStatusAnimation;

  late AnimationController _tempAnimationController;
  late Animation<double> _carShiftAnimation;
  late Animation<double> _TempShowInfoAnimation;
  late Animation<double> _CoolGlowAnimation;

  void SetupBatteryAnimation() {
    _btrAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animationBattery = CurvedAnimation(
      parent: _btrAnimationController,
      curve: Interval(0.0, 0.5),
    );
    _btrStatusAnimation = CurvedAnimation(
      parent: _btrAnimationController,
      curve: Interval(0.6, 1),
    );
  }

  void setupTempAnimation() {
    _tempAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _carShiftAnimation = CurvedAnimation(
      parent: _tempAnimationController,
      curve: Interval(0.2, 0.4),
    );

    _TempShowInfoAnimation = CurvedAnimation(
      parent: _tempAnimationController,
      curve: Interval(0.45, 0.65),
    );
    _CoolGlowAnimation = CurvedAnimation(
      parent: _tempAnimationController,
      curve: Interval(0.7, 1),
    );
  }

  @override
  void initState() {
    SetupBatteryAnimation();
    setupTempAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _btrAnimationController.dispose();
    _tempAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge(
            [_hController, _btrAnimationController, _tempAnimationController]),
        builder: (context, snapshot) {
          return Scaffold(
            bottomNavigationBar: CarBottomNavBar(
              onTap: (int index) {
                if (index == 1) {
                  _btrAnimationController.forward();
                } else if (_hController.selectedBottomTab == 1 && index != 1) {
                  _btrAnimationController.reverse(from: 0.7);
                }
                _hController.onBottomNavigationTabChange(index);
                if (index == 2) {
                  _tempAnimationController.forward();
                } else if (_hController.selectedBottomTab != 2 && index != 2) {
                  _tempAnimationController.reverse(from: 0.4);
                }
              },
              selectedTab: _hController.selectedBottomTab,
            ),
            body: SafeArea(child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                    ),
                    Positioned(
                      left: constraints.maxWidth / 2 * _carShiftAnimation.value,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: constraints.maxHeight * 0.1),
                        child: SvgPicture.asset(
                          "assets/icons/Car.svg",
                          width: double.infinity,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      curve: Curves.easeInOut,
                      left: _hController.selectedBottomTab == 0
                          ? constraints.maxWidth * 0.05
                          : constraints.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        curve: Curves.easeInOut,
                        opacity: _hController.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          IsLock: _hController.isLeftDoorLock,
                          press: () => _hController.updateLeftDoorLock(),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      curve: Curves.easeInOut,
                      right: _hController.selectedBottomTab == 0
                          ? constraints.maxWidth * 0.05
                          : constraints.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        curve: Curves.easeInOut,
                        opacity: _hController.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          IsLock: _hController.isRightDoorLock,
                          press: () => _hController.updateRightDoorLock(),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      curve: Curves.easeInOut,
                      top: _hController.selectedBottomTab == 0
                          ? constraints.maxHeight * 0.15
                          : constraints.maxHeight / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        curve: Curves.easeInOut,
                        opacity: _hController.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          IsLock: _hController.isFrontBootLock,
                          press: () => _hController.updateFrontBootLock(),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      curve: Curves.easeInOut,
                      bottom: _hController.selectedBottomTab == 0
                          ? constraints.maxHeight * 0.16
                          : constraints.maxHeight / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        curve: Curves.easeInOut,
                        opacity: _hController.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          IsLock: _hController.isBackBootLock,
                          press: () => _hController.updateBackBootLock(),
                        ),
                      ),
                    ),

                    //Battrey
                    Opacity(
                      opacity: _animationBattery.value,
                      child: SvgPicture.asset(
                        "assets/icons/Battery.svg",
                        width: constraints.maxWidth * 0.45,
                      ),
                    ),

                    // Battery UI
                    Positioned(
                      top: 50 * (1 - _btrStatusAnimation.value),
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      child: Opacity(
                          opacity: _btrStatusAnimation.value,
                          child: BatteryStatus(
                            constraints: constraints,
                          )),
                    ),
                    Positioned(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      top: 60 * (1 - _TempShowInfoAnimation.value),
                      child: Opacity(
                          opacity: _TempShowInfoAnimation.value,
                          child: TempDetils(hController: _hController)),
                    ),
                    Positioned(
                        right: -180 * (1 - _CoolGlowAnimation.value),
                        child: AnimatedSwitcher(
                          duration: defaultDuration,
                          child: _hController.isCoolselected
                              ? Image.asset(
                                  "assets/images/Cool_glow_2.png",
                                  key: UniqueKey(),
                                  width: 200,
                                )
                              : Image.asset(
                                  "assets/images/Hot_glow_4.png",
                                  key: UniqueKey(),
                                  width: 200,
                                ),
                        ))
                  ],
                );
              },
            )),
          );
        });
  }
}
