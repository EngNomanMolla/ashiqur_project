import 'package:food_app/model/product_model.dart';
import 'package:food_app/network/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var loader = false.obs;
  var productList = ProductModel().obs;

  late ProductService _productService;

  @override
  void onInit() {
    _productService = ProductService();
    getData();
    super.onInit();
  }

  void getData() async {
    loader.value = true;
    var resultData = await _productService.getProductData();
    if (resultData != null) {
      productList.value = resultData;
      loader.value = false;
    }
  }

  updatePrice(int i, int count) {
    productList.value.popular![i].price! * count;
    update();
  }
}
