import 'package:analytica_task/utils/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:analytica_task/models/cart_model.dart';

class CartController extends GetxController {
  final cartItems = <CartModel>[].obs;
  var totalPrice = 0.0.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? cartId; 

  @override
  void onInit() {
    super.onInit();

    fetchCartItems();
  }

  Stream<QuerySnapshot> fetchCartItems() {
    final userId = _auth.currentUser?.uid;
    if (userId != null) {
      return _firestore
          .collection('carts')
          .where('uid', isEqualTo: userId)
          .snapshots();
    } else {
      throw Exception("User ID not found.");
    }
  }

  void calculateTotalPrice() {
    totalPrice.value =
        cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  void removeFromCart(String productId) {
    final userId = _auth.currentUser?.uid;
    if (userId != null) {
      _firestore
          .collection('carts')
          .doc(productId)
          .delete()
          .catchError((error) {
        Get.snackbar("Error", "Failed to remove item: $error",
            backgroundColor: AppTheme.red, colorText: AppTheme.white);
      });
    }
  }
}
