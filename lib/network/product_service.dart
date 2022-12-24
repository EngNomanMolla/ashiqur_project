import 'package:food_app/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<ProductModel?> getProductData() async {
    http.Response response = await http
        .get(Uri.parse("https://grocery.ebasket.com.bd/api/popular-productv2"));

    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    }
  
  }
}
