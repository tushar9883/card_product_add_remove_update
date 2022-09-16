import 'package:card_product_add_remove/controller/cart_crontroller.dart';
import 'package:card_product_add_remove/model/producat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_total.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();

  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data;
    return Obx(() {
      return Column(
        children: [
          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (BuildContext context, int index) {
                data = controller.products.keys.toList()[index];
                return CartProductCard(
                  controller: controller,
                  index: index,
                  quantity: controller.products.values.toList()[index],
                  product: controller.products.keys.toList()[index],
                );
              },
            ),
          ),
          CartTotal(),
        ],
      );
    });
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  const CartProductCard({
    Key? key,
    required this.index,
    required this.controller,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              product.imageUrl,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(product.name),
          ),
          IconButton(
            onPressed: () {
              controller.removeProduct(product);
            },
            icon: const Icon(Icons.remove_circle),
          ),
          Text("${quantity}"),
          IconButton(
            onPressed: () {
              controller.addProduct(product);
            },
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
    );
  }
}
