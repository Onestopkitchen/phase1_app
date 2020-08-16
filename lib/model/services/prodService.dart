import 'package:http/http.dart' as http;
import 'package:osk_dev_app/model/core/Product.dart';

class ProdService {
  String chosen_brand;

  Future<List<ProductElement>> getProducts() async {
    try {
      String getOskProductsUrl =
          "http://api.onestopkitchen.in/api/getproductsbybrand?key=${chosen_brand.toLowerCase()}";
      Map<String, String> headers = {"Content-Type": "application/json"};
      http.Response response =
          await http.get(getOskProductsUrl, headers: headers);
      if (response.statusCode == 200) {
        print("Success -> Status Code: ${response.statusCode}");
        final product = productFromJson(response.body);
        return product.products;
      } else {
        print(
            "Error in getting products -> Status Code: ${response.statusCode}");
      }
    } catch (err) {
      print("Error in getting Products using API : ${err}");
    }
  }
}
