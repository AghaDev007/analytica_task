import 'package:analytica_task/models/products_model.dart';
import 'package:analytica_task/services/dio_network_service.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:analytica_task/utils/widgets/api_urls/api_urls.dart';
import 'package:get/get.dart';

class ProductsApiProvider {
  static final ProductsApiProvider _instance = ProductsApiProvider._internal();

  factory ProductsApiProvider() {
    return _instance;
  }

  ProductsApiProvider._internal();

  final DioNetworkService _dioNetworkService = DioNetworkService();

  Future<List<ProductsModel>> getProductsData() async {
    try {
      final response = await _dioNetworkService.get(requestURL: ApiUrl.product);

      if (response.statusCode == 200) {
        final List<dynamic> productsJson = response.data;
        final products = productsJson
            .map((productJson) => ProductsModel.fromJson(productJson))
            .toList();
        return products;
      } else {
        Get.snackbar(
          'Error',
          'Error Fetching Products',
          backgroundColor: AppTheme.primary,
          colorText: AppTheme.white,
        );
        throw Exception('Failed to load products data');
      }
    } catch (e, s) {
      Get.snackbar(
        'Exception',
        'Error while fetching products data',
        backgroundColor: AppTheme.primary,
        colorText: AppTheme.white,
      );
      throw Exception('Error while fetching products data: $e\nStackTrace: $s');
    }
  }
}
