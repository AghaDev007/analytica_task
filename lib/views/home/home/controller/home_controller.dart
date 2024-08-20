import 'dart:async';
import 'package:analytica_task/api_providers/products_api_provider.dart';
import 'package:analytica_task/models/products_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:analytica_task/models/offers_model.dart';

import '../../../../utils/app_images.dart';

class HomeController extends GetxController {
  var auth = FirebaseAuth.instance.currentUser;
  var myCurrentIndex = 0.obs;
  RxString searchQuery = "".obs;
  TextEditingController search = TextEditingController();
  changeSearchQuery(String res) {
    searchQuery.value = res;
    update();
  }

  var isLoading = true.obs;

  final List<Map<String, String>> exercises = [
    {
      'reps': "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
      'catName': 'Electronics'
    },
    {
      'reps':
          "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
      'catName': 'Jewelery'
    },
    {
      'reps': "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      'catName': 'Men'
    },
    {
      'reps': "https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_.jpg",
      'catName': 'Women'
    },
  ];

  RxList<ProductsModel> products = <ProductsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      final fetchedProducts = await ProductsApiProvider().getProductsData();
      products.assignAll(fetchedProducts);
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print('Error fetching products: $e');
    }
  }
}
