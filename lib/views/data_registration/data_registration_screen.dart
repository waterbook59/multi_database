import 'package:flutter/material.dart';

class DataRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(  'DBデータを表示'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Text('ここに名前'),
                const SizedBox(height: 10,),
                Text('productName'),
                const SizedBox(height: 10,),
                Text('productDiscription'),
                const SizedBox(height: 10,),
                Text('productImage:small:'),
              ],
            ),
          ),
        ),

    );
  }
}
