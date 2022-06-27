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

  bool isShowTyre = false;
  void showTyreContrroller(int index) {
    Future.delayed(const Duration(milliseconds: 400), (() {
      if (selectedBottomTab != 3 && index == 3) {
        isShowTyre = true;
        notifyListeners();
      } else {
        isShowTyre = false;
        notifyListeners();
      }
    }));
  }

  bool isShowTyreStatus = false;

  void tyreStatusController(int index) {
    if (selectedBottomTab != 3 && index == 3) {
      isShowTyreStatus = true;
      notifyListeners();
    } else {
      Future.delayed(const Duration(milliseconds: 500), (() {
        isShowTyreStatus = false;
        notifyListeners();
      }));
    }
  }
}
