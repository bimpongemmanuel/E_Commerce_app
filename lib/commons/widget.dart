 import 'package:flutter/material.dart';

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

