import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/blocs/product_bloc/product_cubit.dart';
import 'package:kiosk/jayne/blocs/product_bloc/product_state.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';
import 'package:kiosk/jayne/enhances/responsive_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kiosk/jayne/router/routes_name.dart';

class ProductInformationPage extends StatefulWidget {
  const ProductInformationPage({super.key});

  @override
  State<ProductInformationPage> createState() => _ProductInformationPageState();
}

class _ProductInformationPageState extends State<ProductInformationPage> {
  int quantity = 1;
  String selectedColor = "janey.product_individual_page.black".tr();
  String selectedStorage = "janey.product_individual_page.256GB".tr();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProductInformationPageArguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: ResponsiveText(
          content: "jayne.product_individual_page.app_bar".tr(),
          textStyle: JTextTheme.title1,
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image Section
                Expanded(
                  child: Column(
                    children: [
                      ResponsiveImage(
                        args.images![0].toString(),
                        assetType: AssetType.network,
                        baseHeight: 500,
                        baseWidth: 500,
                        themeName: "",
                        themeDirectory: "",
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Product Info Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ResponsiveText(content: args.brandName, textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      ResponsiveText(content: args.price.toString(), textStyle: const TextStyle(fontSize: 20, color: Colors.black)),
                      const SizedBox(height: 20),
                      ResponsiveText(
                        content: "janey.product_individual_page.color".tr(),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          ColorButton(
                            colorName: "janey.product_individual_page.black".tr(),
                            isSelected: selectedColor == "janey.product_individual_page.black".tr(),
                            onTap: () {
                              setState(() => selectedColor = "janey.product_individual_page.white".tr());
                              context.read<ProductCubit>().updateColorInShoppingCart(totalColorInShoppingCart: selectedColor);
                            },
                          ),
                          ColorButton(
                            colorName: "janey.product_individual_page.white".tr(),
                            isSelected: selectedColor == "janey.product_individual_page.white".tr(),
                            onTap: () {
                              setState(() => selectedColor = "janey.product_individual_page.white".tr());
                              context.read<ProductCubit>().updateColorInShoppingCart(totalColorInShoppingCart: selectedColor);
                            },
                          ),
                          ColorButton(
                            colorName: "janey.product_individual_page.purple".tr(),
                            isSelected: selectedColor == "janey.product_individual_page.purple".tr(),
                            onTap: () {
                              setState(() => selectedColor = "janey.product_individual_page.purple".tr());
                              context.read<ProductCubit>().updateColorInShoppingCart(totalColorInShoppingCart: selectedColor);
                            },
                          ),
                          ColorButton(
                            colorName: "janey.product_individual_page.brown".tr(),
                            isSelected: selectedColor == "janey.product_individual_page.brown".tr(),
                            onTap: () {
                              setState(() => selectedColor = "janey.product_individual_page.brown".tr());
                              context.read<ProductCubit>().updateColorInShoppingCart(totalColorInShoppingCart: selectedColor);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ResponsiveText(
                        content: 'jayne.product_individual_page.memory'.tr(),
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          StorageButton(
                            storage: "janey.product_individual_page.256GB".tr(),
                            isSelected: selectedStorage == "janey.product_individual_page.256GB".tr(),
                            onTap: () {
                              setState(() => selectedStorage = "janey.product_individual_page.256GB".tr());
                              context.read<ProductCubit>().updateMemoryInShoppingCart(totalMemoryInShoppingCart: selectedStorage);
                            },
                          ),
                          StorageButton(
                            storage: "janey.product_individual_page.512GB".tr(),
                            isSelected: selectedStorage == "janey.product_individual_page.512GB".tr(),
                            onTap: () {
                              setState(() => selectedStorage = "janey.product_individual_page.512GB".tr());
                              context.read<ProductCubit>().updateMemoryInShoppingCart(totalMemoryInShoppingCart: selectedStorage);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Quantity selector
                      Row(
                        children: [
                          ResponsiveText(
                            content: 'jayne.product_individual_page.number_of_quantity'.tr(),
                            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() => quantity = quantity > 1 ? quantity - 1 : 1);
                              context.read<ProductCubit>().updateQuantityInShoppingCart(totalQuantityInShoppingCart: quantity);
                            },
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                          Text('$quantity', style: const TextStyle(fontSize: 18)),
                          IconButton(
                            onPressed: () {
                              setState(() => quantity++);
                              context.read<ProductCubit>().updateQuantityInShoppingCart(totalQuantityInShoppingCart: quantity);
                            },
                            icon: const Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          List<ShoppingCartInfo> shoppingCardList = [];
                          shoppingCardList.add(ShoppingCartInfo(
                            imageUrl: args.images![0].toString(),
                            brandName: args.brandName,
                            storage: selectedStorage,
                            quantity: quantity, // Nullable quantity
                            price: args.price, // Nullable price
                            color: selectedColor,
                          ));
                          context.read<ProductCubit>().updateTotalShoppingCartList(shoppingCartList: shoppingCardList);
                          // TODO Action for 'Buy' button
                          context.pushNamed(
                            RouteName.shoppingCartPage.name, //
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.black,
                        ),
                        child: ResponsiveText(
                          content: 'janey.product_individual_page.order'.tr(),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Product Description Section
            ResponsiveText(
              content: 'jayne.product_individual_page.feature'.tr(),
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ResponsiveText(
              //TODO productInformation
              content: args.productInformation,
              textStyle: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: const ResponsiveImage(
                'assets/images/back.json',
                assetType: AssetType.animation,
                baseWidth: 120,
              ),
              onTap: () {
                context.pop();
              },
            ),
            Row(
              children: [
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        // TODO Action for 'Cart' button
                        context.pushNamed(RouteName.shoppingCartPage.name);
                      },
                      icon: const Icon(Icons.shopping_cart),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    // TODO Action for 'Consult AI' button
                    context.goNamed(RouteName.aiAssistantPage.name);
                  },
                  icon: const Icon(Icons.support_agent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Widget for Color Selection
class ColorButton extends StatelessWidget {
  final String colorName;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorButton({
    super.key,
    required this.colorName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          colorName,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

// Custom Widget for Storage Selection
class StorageButton extends StatelessWidget {
  final String storage;
  final bool isSelected;
  final VoidCallback onTap;

  const StorageButton({
    super.key,
    required this.storage,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          storage,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class ProductInformationPageArguments {
  final List<String>? images;
  final String productInformation;
  final String brandName;
  final double price;

  ProductInformationPageArguments({
    required this.images,
    required this.productInformation,
    required this.brandName,
    required this.price,
  });
}
