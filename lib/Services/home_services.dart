import 'package:flutter/widgets.dart';

class HomeController extends ChangeNotifier {
  int selectedBottomTab = 0;

  void onBottomNavigationTabChange(int index) {
    selectedBottomTab = index;
    notifyListeners();
  }

  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
  bool isFrontBootLock = true;
  bool isBackBootLock = true;

  void updateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;
    notifyListeners();
  }

  void updateLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    notifyListeners();
  }

  void updateBackBootLock() {
    isBackBootLock = !isBackBootLock;
    notifyListeners();
  }

  void updateFrontBootLock() {
    isFrontBootLock = !isFrontBootLock;
    notifyListeners();
  }

  bool isCoolselected = true;

  void updateCoolSelected() {
    isCoolselected = !isCoolselected;
    notifyListeners();
  }
}
