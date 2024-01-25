
import 'package:http/http.dart' as http;
import 'package:sgold/Services/product_fromAPI.dart';

class RemoteService {
  Future<List<ProductApi>?> getProducts() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.https('fakestoreapi.com', 'products/category/jewelery'),
      );

      if (response.statusCode == 200) {
        var json = response.body;
        return productApiFromJson(json);
      }
    } finally {
      client.close();
    }
  }
}
