import 'package:ecomers_app/models/all_product_models.dart';
import 'package:http/http.dart';

class AllProductNetwork{

  Future<List<ProductsModels>> getAllProduct () async{
     final response = await get(Uri.parse('https://api.escuelajs.co/api/v1/products'));


     if(response.statusCode == 200){
      print(response.body);
      return productsModelsFromJson(response.body);
     }else{
      throw{
      Exception(
        'Failed to get data from API'
      )
      };
      
     }
  } 
}