import 'package:ecomers_app/commons/widget.dart';
import 'package:ecomers_app/models/all_product_models.dart';
import 'package:ecomers_app/network/all_product_network.dart';
import 'package:ecomers_app/screens/all_product_details_screen.dart';
import 'package:flutter/material.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {

  final AllProductNetwork _allProductNetwork =AllProductNetwork();

   Future<List<ProductsModels>>? getProduct;

      @override
  void initState() {
    getProduct = _allProductNetwork.getAllProduct();
    super.initState();
  }
       

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 18, fontWeight: FontWeight.bold);
    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    );
    return Scaffold(
      appBar: prodectViewAppBar(context, titleStyle),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom:15),
                child: Text(
                  'Choose a brand',
                  style: titleStyle,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal:10),
                        border: outlineInputBorder,
                        focusedBorder: outlineInputBorder,
                        hintText: 'Search for brand',
                        prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Material(
                    color: const Color(0xff4FAFFA),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.sort,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
        
              SizedBox(height: MediaQuery.of(context).size.height/10,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brands.length,
                itemBuilder:(context, index) =>  Padding(
                  padding:  EdgeInsets.all(3.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(brands[index]),
                    backgroundColor: Colors.grey,
                  ),
                ),),
              ),
        
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Products',style: titleStyle,),
                    const Text('13 items')
                  ],
                ),
              ),
        
              FutureBuilder<List<ProductsModels>>(
                future: getProduct,
                builder: (context,AsyncSnapshot<List<ProductsModels>> snapshot) {
                  if(snapshot.hasData){
                    return ListView.separated(
                    separatorBuilder: (context, index) =>const SizedBox(height:10 ,),
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) => ProductCard(titleStyle: titleStyle,allProducts: snapshot.data![index],)));
                  }else{
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  
                  },
                  
                
              ),
              
        
              
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
   ProductCard({
    Key? key,
    required this.titleStyle,
    this.allProducts,
  }) : super(key: key);

   final TextStyle titleStyle;

   ProductsModels? allProducts;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: const Color.fromARGB(255, 236, 230, 230),
        borderRadius: BorderRadius.circular(10)),
      height: 130,
      padding:const EdgeInsets.all(10),
      child: Row(
        children: [
          GestureDetector(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(             
                height: 120,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // image: DecorationImage(
                  //   fit: BoxFit.fill,
                  //   // image: NetworkImage(''),
                  //   )
                ),
              ),
            ),
             onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => ProductDetails(allProducts: allProducts,),));
              },
          ),
         const SizedBox(width: 5,),
          Expanded(
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(allProducts!.title!,
                  ),
                   Text('Id:${allProducts!.id!}'),
                   Text('Category:red'),
                  Text(allProducts!.price!.toString(),style: titleStyle,)
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => ProductDetails(allProducts: allProducts,),));
              },
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
               const Icon(Icons.favorite_border_outlined),
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                   color: const Color(0xff4FAFFA),
                   child: const Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text('Add to Cart',style:TextStyle(color: Colors.white),),
                  ))
              ],
            ),
          )
        ],
      ),
    );
  }
}








List brands = [
  'https://images.unsplash.com/photo-1555274175-75f4056dfd05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YWRpZGFzJTIwbG9nb3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1637844528447-aee837ccfc7f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG5pa2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1608379894453-c6b729b05596?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cHVtYSUyMHNuZWFrZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1582231640349-6ea6881fabeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHJlZWJvayUyMHNob2VzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.pexels.com/photos/1598505/pexels-photo-1598505.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c25lYWtlcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1565814636199-ae8133055c1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c25lYWtlcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1560769629-975ec94e6a86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fHNuZWFrZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
];