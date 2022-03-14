import 'package:flutterlearn/getxImplementation/models/product.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    await Future.delayed(Duration(seconds: 1));
    var response = [
      Product(1, "Product 1", "detail 1", 30),
      Product(2, "Product 2", "detail 2", 35),
      Product(3, "Product 3", "detail 3", 40),
      Product(4, "Product 4", "detail 4", 45),
      Product(5, "Product 5", "detail 5", 50),
      Product(6, "Product 6", "detail 6", 30),
      Product(7, "Product 7", "detail 7", 35),
      Product(8, "Product 8", "detail 8", 40),
      Product(9, "Product 9", "detail 9", 45),
      Product(10,"Product 10","detail 10", 50)

    ];
    products.value=response;
  }
}
