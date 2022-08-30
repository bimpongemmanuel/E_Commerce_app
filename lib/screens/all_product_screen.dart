import 'package:flutter/material.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({Key? key}) : super(key: key);

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
              itemCount: 10,
              itemBuilder:(context, index) => Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                ),
              ),),
            )
          ],
        ),
      ),
    );
  }

  AppBar prodectViewAppBar(BuildContext context, TextStyle titleStyle) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.grey[400]),
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 80,
      leading: Container(
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1558203728-00f45181dd84?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cHJvZmlsZSUyMGltYWdlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')),
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        height: 50,
        width: 50,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello',
            style: titleStyle,
          ),
          Text(
            ' Emma',
            style: titleStyle.copyWith(),
          )
        ],
      ),
      actions: const [
        Icon(Icons.notifications),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
