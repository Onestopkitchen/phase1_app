import 'package:http/http.dart' as http;
import 'package:osk_dev_app/model/core/Product.dart';

class CateService {
  String chosen_cate;

  Future<List<ProductElement>> getProductsonCategory() async {
    try {
      String getCategoryProductsUrl =
          "http://api.onestopkitchen.in/api/getproductsbycategory?key=${chosen_cate.toLowerCase()}";
      Map<String, String> headers = {"Content-Type": "application/json"};
      http.Response response =
          await http.get(getCategoryProductsUrl, headers: headers);
      if (response.statusCode == 200) {
        print("Success -> Status Code: ${response.statusCode}");
        final product = productFromJson(response.body);
        return product.products;
      } else {
        print(
            "Error in getting categories -> Status Code: ${response.statusCode}");
      }
    } catch (err) {
      print("Error in getting Categories using API : ${err}");
    }
  }
}
