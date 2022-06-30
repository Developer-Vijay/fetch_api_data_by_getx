import 'package:fetch_api_data/api_module/api_service.dart';
import 'package:fetch_api_data/models/product-models.dart';
import 'package:get/get.dart';

class ProductConroller extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
