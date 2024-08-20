import 'package:analytica_task/models/products_model.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:analytica_task/models/cart_model.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

class ProductDetailController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var quantity = 0.obs;
  var loading = false.obs;
  void increment() {
    quantity.value++;
  }

  void decrement() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  Future addToCart(ProductsModel product) async {
    final user = FirebaseAuth.instance.currentUser;
    loading.value = true;
    var uuid = Uuid().v1();
    try {
      if (user != null && quantity.value > 0) {
        final cartItem = CartModel(
          userId: user.uid,
          productId: uuid,
          title: product.title,
          price: product.price,
          quantity: quantity.value,
          image: product.image,
        );

        await _firestore.collection('carts').doc(uuid).set(cartItem.toMap());
        Get.close(1);
        Get.snackbar("Alert", "Added to Cart Successfully",
            backgroundColor: AppTheme.primary, colorText: AppTheme.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to add to cart: $e",
          backgroundColor: AppTheme.red, colorText: AppTheme.white);
    } finally {
      loading.value = false;
    }
  }
}
