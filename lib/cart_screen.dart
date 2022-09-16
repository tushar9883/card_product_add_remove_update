import 'package:card_product_add_remove/widget/cart_product.dart';
import 'package:card_product_add_remove/widget/cart_total.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CartProducts(),
            // CartTotal(),
          ],
        ),
      ),
    );
  }
}
