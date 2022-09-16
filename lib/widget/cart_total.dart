import 'package:card_product_add_remove/controller/cart_crontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotal extends StatefulWidget {
  CartTotal({Key? key}) : super(key: key);

  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 75,
        ),
        child: controller.total != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    '${controller.total}',
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  )
                ],
              )
            : Text(" Empty"),
      );
    });
  }
}
