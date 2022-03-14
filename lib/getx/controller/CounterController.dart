import 'package:get/get.dart';

class CounterCountroller extends GetxController{

  Rx<int> intValue = 0.obs;

  increment(){
    intValue.value ++;
  }
  decincrement(){
    intValue.value --;
  }

}

