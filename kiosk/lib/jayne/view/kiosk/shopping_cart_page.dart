import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/blocs/product_bloc/product_cubit.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';
import 'package:kiosk/jayne/enhances/responsive_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kiosk/jayne/router/routes_name.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  int productQuantity = 1;
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    totalPrice = context.read<ProductCubit>().state.shoppingCartList[0].price;
    final storage = context.read<ProductCubit>().state.shoppingCartList[0].storage;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: ResponsiveText(
          content: 'jayne.cart_page.cart'.tr(),
          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cart Title
              ResponsiveText(
                content: 'jayne.cart_page.shopping_cart'.tr(),
                textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              buildCartItem(
                productName: context.read<ProductCubit>().state.shoppingCartList[0].brandName,
                color: context.read<ProductCubit>().state.shoppingCartList[0].color,
                storage: 'หน่วยความจำ $storage',
                price: context.read<ProductCubit>().state.shoppingCartList[0].price,
                quantity: productQuantity,
                onRemove: () {
                  setState(() {
                    productQuantity = 0;
                    totalPrice -= 30000;
                  });
                },
                onDecrease: () {
                  if (productQuantity > 1) {
                    setState(() {
                      productQuantity--;
                      totalPrice -= 30000;
                    });
                  }
                },
                onIncrease: () {
                  setState(() {
                    productQuantity++;
                    totalPrice += 30000;
                  });
                },
              ),
              const SizedBox(height: 10),
              // Promotion Section
              ResponsiveText(
                content: 'jayne.cart_page.promotion'.tr(),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Promotion Item
              buildPromotionItem(
                title: 'Promotion',
                details: ['airpod air 2 ฟรี + ประกัน 2 ปี'],
                onRemove: () {
                  // TODO Remove promotion logic here
                },
              ),
              const SizedBox(height: 20),
              // Price Summary Section
              buildPriceSummary(context, totalPrice),
              const SizedBox(height: 20),
              // Bottom Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // TODO Go back
                      context.pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(150, 50),
                    ),
                    //jayne.common.back
                    child: ResponsiveText(
                      content: 'jayne.common.back'.tr(),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // TODO Confirm purchase
                      context.pushNamed(RouteName.thankYouPage.name);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(150, 50),
                    ),
                    child: ResponsiveText(
                      content: 'jayne.common.confirm'.tr(),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build Cart Item Widget
  Widget buildCartItem({
    required String productName,
    required String color,
    required String storage,
    required double price,
    required int quantity,
    required VoidCallback onRemove,
    required VoidCallback onDecrease,
    required VoidCallback onIncrease,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveImage(
                context.read<ProductCubit>().state.shoppingCartList[0].imageUrl,
                assetType: AssetType.network,
                baseHeight: 100,
                baseWidth: 100,
                themeName: "",
                themeDirectory: "",
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(color),
                    Text(storage),
                    Row(
                      children: [
                        ResponsiveText(
                          content: "jayne.cart_page.total".tr(),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        IconButton(icon: const Icon(Icons.remove), onPressed: onDecrease),
                        Text('$quantity'),
                        IconButton(icon: const Icon(Icons.add), onPressed: onIncrease),
                        const Spacer(),
                        ResponsiveText(
                          content: '฿ $price',
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.red),
                onPressed: onRemove,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Build Promotion Item Widget
  Widget buildPromotionItem({
    required String title,
    required List<String> details,
    required VoidCallback onRemove,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: ResponsiveText(
                  content: title,
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.red),
                onPressed: onRemove,
              ),
            ],
          ),
          ...details.map(
            (detail) => Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResponsiveText(
                    content: detail,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  const ResponsiveText(
                    content: 'X 1',
                    textStyle: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build Price Summary Widget
  Widget buildPriceSummary(BuildContext context, double totalPrice) {
    context.read<ProductCubit>().updateTotalPriceInShoppingCart(totalPriceInShoppingCart: totalPrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ResponsiveText(
              content: "jayne.cart_page.total_product_price".tr(),
              textStyle: const TextStyle(fontSize: 16),
            ),
            ResponsiveText(
              content: '฿ $totalPrice',
              textStyle: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ResponsiveText(
              content: "jayne.cart_page.discount".tr(),
              textStyle: const TextStyle(fontSize: 16),
            ),
            const ResponsiveText(
              content: '฿ 0',
              textStyle: TextStyle(fontSize: 16),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ResponsiveText(
              content: "jayne.cart_page.total_order_amount".tr(),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ResponsiveText(
              content: '฿ $totalPrice',
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
