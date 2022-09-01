import 'package:ecomers_app/models/all_product_models.dart';
import 'package:ecomers_app/screens/all_product_screen.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
   ProductDetails({Key? key,this.allProducts}) : super(key: key);

  ProductsModels? allProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.push(
            context, MaterialPageRoute(builder: (context) =>AllProductScreen() ,));
        },
         icon:const Icon(Icons.arrow_back,color: Colors.black,)),
        title: const Text(
          'Shoe details',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
                // image: DecorationImage(image: NetworkImage('url')),
              ),
            ),
           const SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allProducts!.title!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 30,fontWeight: FontWeight.bold),
                ),
               const SizedBox(height: 10,),
                Text(allProducts!.price!.toString(),
                style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 20),),
              ],
            ),
           const  SizedBox(height: 10,),
            Row(
              children:const [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(Icons.star, color: Colors.grey),
                Text('3.9')
              ],
            ),
           const SizedBox(height: 10,),
            Row(
              children: [
                Material(
                  shape: RoundedRectangleBorder(
                      side:const BorderSide(
                          color: Colors.blue, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Icon(Icons.favorite_border),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.blue,),
                      onPressed: () {},
                      child: Text(
                        'Add to cart',
                        style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 20,color: Colors.white),
                       
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
