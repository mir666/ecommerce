import 'package:get/get.dart';

class MainBottomNavBarController extends GetxController{
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changIndex(int index){
    _selectedIndex = index;
    update();
  }

  void moveToCategory(){
    changIndex(1);
  }

  void backToHome(){
    changIndex(0);
  }
}