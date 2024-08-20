import 'package:analytica_task/models/cart_model.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:analytica_task/utils/widgets/button_widget.dart';
import 'package:analytica_task/views/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartView extends StatelessWidget {
  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: AppTheme.white,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.fetchCartItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }

          var cartItems = snapshot.data!.docs
              .map((doc) =>
                  CartModel.fromMap(doc.data() as Map<String, dynamic>))
              .toList();

          double totalPrice = cartItems.fold(
              0.0, (sum, item) => sum + (item.price * item.quantity));

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    return ListTile(
                      leading: Image.network(cartItem.image),
                      title: Text(cartItem.title),
                      subtitle: Text("Quantity: ${cartItem.quantity}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("\$${cartItem.price * cartItem.quantity}"),
                          IconButton(
                            icon: const Icon(Icons.delete, color: AppTheme.red),
                            onPressed: () {
                              controller.removeFromCart(cartItem.productId);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Price:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$${totalPrice.toStringAsFixed(1)}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ButtonWidget(
                width: context.width * 0.8,
                height: 50,
                stringText: "Proceed to Checkout",
              )
            ],
          );
        },
      ),
    );
  }
}
