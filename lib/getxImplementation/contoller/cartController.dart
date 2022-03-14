
import 'package:flutterlearn/getxImplementation/models/product.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
class CartController extends GetxController{

  var addToCart=<Product>[].obs;
 double get totalPrice=>addToCart.fold(0, (sum, item) => sum + item.price);
 int get count=>addToCart.length;

  Addtocart(Product product)
  {
    this.addToCart.add(product);
  }

  Removetocart(Product product)
  {
    if(!addToCart.contains(product)){
      Fluttertoast.showToast(msg: "This product was not added");
    }
    this.addToCart.remove(product);
  }

}