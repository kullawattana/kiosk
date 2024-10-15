import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/blocs/product_bloc/product_cubit.dart';
import 'package:kiosk/jayne/blocs/product_bloc/product_state.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';
import 'package:kiosk/jayne/enhances/responsive_text.dart';
import 'package:kiosk/jayne/layouts/popup_container.dart';
import 'package:kiosk/jayne/layouts/popup_layout.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kiosk/jayne/repository/service_provider.dart';
import 'package:kiosk/jayne/router/routes_name.dart';
import 'package:kiosk/jayne/view/kiosk/product_information_page.dart';

class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({super.key});

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  String? selectedBrand;
  String? selectedUsage;
  String? selectedPrice;

  bool isSelectRecommendTab = false;
  bool isSelectMobileTab = false;
  bool isSelectTabletTab = false;
  bool isSelectNotebookTab = false;
  bool isSelectSmartWatchTab = false;
  bool isSelectEarPhoneTab = false;
  bool isSelectAccessoriesTab = false;

  @override
  void initState() {
    isSelectRecommendTab = true;
    isSelectMobileTab = false;
    isSelectTabletTab = false;
    isSelectNotebookTab = false;
    isSelectSmartWatchTab = false;
    isSelectEarPhoneTab = false;
    isSelectAccessoriesTab = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<ProductCubit, ProductState>(
        key: const Key("product_search_page"),
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) async {

        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // Side Menu
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  color: isSelectRecommendTab ? Colors.black : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  title: Text(
                                    'jayne.product_recommend_page.recommend_tab'.tr(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: isSelectRecommendTab ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  onTap: () {
                                    context.read<ProductCubit>().getProductOnAWSBedrock(inputText: "แนะนำสินค้า");
                                    setState(() {
                                      isSelectRecommendTab = true;
                                      isSelectMobileTab = false;
                                      isSelectTabletTab = false;
                                      isSelectNotebookTab = false;
                                      isSelectSmartWatchTab = false;
                                      isSelectEarPhoneTab = false;
                                      isSelectAccessoriesTab = false;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  color: isSelectMobileTab ? Colors.black : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  title: Text(
                                    'jayne.product_recommend_page.mobile_tab'.tr(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: isSelectMobileTab ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  onTap: () {
                                    context.read<ProductCubit>().getProductOnAWSBedrock(inputText: "มือถือ");
                                    setState(() {
                                      isSelectRecommendTab = false;
                                      isSelectMobileTab = true;
                                      isSelectTabletTab = false;
                                      isSelectNotebookTab = false;
                                      isSelectSmartWatchTab = false;
                                      isSelectEarPhoneTab = false;
                                      isSelectAccessoriesTab = false;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  color: isSelectTabletTab ? Colors.black : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  title: Text(
                                    'jayne.product_recommend_page.tablet_tab'.tr(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: isSelectTabletTab ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  onTap: () {
                                    context.read<ProductCubit>().getProductOnAWSBedrock(inputText: "แท็บเล็ต");
                                    setState(() {
                                      isSelectRecommendTab = false;
                                      isSelectMobileTab = false;
                                      isSelectTabletTab = true;
                                      isSelectNotebookTab = false;
                                      isSelectSmartWatchTab = false;
                                      isSelectEarPhoneTab = false;
                                      isSelectAccessoriesTab = false;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  color: isSelectNotebookTab ? Colors.black : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  title: Text(
                                    'jayne.product_recommend_page.notebook_tab'.tr(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: isSelectNotebookTab ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  onTap: () {
                                    context.read<ProductCubit>().getProductOnAWSBedrock(inputText: "โน้ตบุ๊ค");
                                    setState(() {
                                      isSelectRecommendTab = false;
                                      isSelectMobileTab = false;
                                      isSelectTabletTab = false;
                                      isSelectNotebookTab = true;
                                      isSelectSmartWatchTab = false;
                                      isSelectEarPhoneTab = false;
                                      isSelectAccessoriesTab = false;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  color: isSelectSmartWatchTab ? Colors.black : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  title: Text(
                                    'jayne.product_recommend_page.smartwatch_tab'.tr(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: isSelectSmartWatchTab ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  onTap: () {
                                    context.read<ProductCubit>().getProductOnAWSBedrock(inputText: "สมาร์ทวอทช์");
                                    setState(() {
                                      isSelectRecommendTab = false;
                                      isSelectMobileTab = false;
                                      isSelectTabletTab = false;
                                      isSelectNotebookTab = false;
                                      isSelectSmartWatchTab = true;
                                      isSelectEarPhoneTab = false;
                                      isSelectAccessoriesTab = false;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  color: isSelectEarPhoneTab ? Colors.black : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  title: Text(
                                    'jayne.product_recommend_page.earphones_tab'.tr(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: isSelectEarPhoneTab ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  onTap: () {
                                    context.read<ProductCubit>().getProductOnAWSBedrock(inputText: "หูฟัง");
                                    setState(() {
                                      isSelectRecommendTab = false;
                                      isSelectMobileTab = false;
                                      isSelectTabletTab = false;
                                      isSelectNotebookTab = false;
                                      isSelectSmartWatchTab = false;
                                      isSelectEarPhoneTab = true;
                                      isSelectAccessoriesTab = false;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  color: isSelectAccessoriesTab ? Colors.black : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  title: Text(
                                    'jayne.product_recommend_page.accessories_tab'.tr(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: isSelectAccessoriesTab ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  onTap: () {
                                    context.read<ProductCubit>().getProductOnAWSBedrock(inputText: "อุปกรณ์เสริม");
                                    setState(() {
                                      isSelectRecommendTab = false;
                                      isSelectMobileTab = false;
                                      isSelectTabletTab = false;
                                      isSelectNotebookTab = false;
                                      isSelectSmartWatchTab = false;
                                      isSelectEarPhoneTab = false;
                                      isSelectAccessoriesTab = true;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Product Grid with Filters
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ResponsiveText(
                                content: 'jayne.product_recommend_page.mobile_tab'.tr(),
                                textStyle: JTextTheme.highlightHeader,
                              ),
                              const SizedBox(height: 20),
                              // Filters
                              Row(
                                children: [
                                  Expanded(
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        labelText: 'jayne.product_individual_page.select_brand'.tr(),
                                        border: const OutlineInputBorder(),
                                      ),
                                      value: selectedBrand,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedBrand = newValue;
                                        });
                                      },
                                      items: [
                                        'Apple',
                                        'Huawei',
                                        'Xiaomi',
                                        'Vivo',
                                        'Samsung',
                                      ].map((String value) {
                                        context.read<ProductCubit>().updateSelectBrand(selectBrandName: value);
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        labelText: "jayne.product_individual_page.choose_usage".tr(),
                                        border: const OutlineInputBorder(),
                                      ),
                                      value: selectedUsage,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedUsage = newValue;
                                        });
                                      },
                                      items: [
                                        'ทั่วไป',
                                        'เล่นเกม',
                                        'ถ่ายรูป',
                                        'ธุรกิจ',
                                      ].map((String value) {
                                        context.read<ProductCubit>().updateSelectUsage(selectUsage: value);
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        labelText: 'jayne.product_individual_page.highest_price'.tr(),
                                        border: const OutlineInputBorder(),
                                      ),
                                      value: selectedPrice,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedPrice = newValue;
                                        });
                                      },
                                      items: [
                                        '10000',
                                        '20000',
                                        '30000',
                                        '40000',
                                      ].map((String value) {
                                        context.read<ProductCubit>().updateSelectPrice(selectBrandPrice: value);
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        final selectBrandName = state.selectBrandName;
                                        final selectUsage = state.selectUsage;
                                        final selectPrice = state.selectPrice;
                                        ServiceProvider().requestProduct(
                                          userContent: '',
                                          botContent: '',
                                          inputText: 'แนะนำมือถือ $selectBrandName ใช้ในการ$selectUsage ราคา $selectPrice ',
                                          minPrice: 1000,
                                          maxPrice: state.selectPrice,
                                          minDiscountPc: 0,
                                          minDiscountValue: 0,
                                          minPoint: 0,
                                        );
                                      },
                                      icon: const Icon(Icons.search)),
                                  IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      // Clear filters
                                      setState(() {
                                        selectedBrand = null;
                                        selectedUsage = null;
                                        selectedPrice = null;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              // Product Grid
                              Expanded(
                                child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 0.75,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  //itemCount: 6, // Number of products
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return ListView.builder(
                                      itemCount: state.productInfo?.length,
                                      itemBuilder: (context, index) {
                                        return ProductCard(
                                          imageUrl: state.productInfo?[index].imageUrl ?? "",
                                          brandName: state.productInfo?[index].brandName ?? "Iphone",
                                          price: state.productInfo?[index].price ?? 0.0,
                                          detail: state.productInfo?[index].detail ?? "",
                                          images: state.productInfo?[index].images ?? [],
                                        );
                                      },
                                    );
                                    // return ProductCard(
                                    //   name: index < 3 ? 'iPhone ${16 + index}' : '',
                                    //   price: index < 3 ? '${30000 + (5000 * index)}' : '',
                                    // );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Bottom Navigation
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // TODO Back action
                          context.pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(150, 50),
                        ),
                        child: ResponsiveText(
                          content: "jayne.common.back".tr(),
                          textStyle: JTextTheme.captionMedium,
                        ),
                      ),
                      Row(
                        children: [
                          BottomActionButton(
                            icon: Icons.shopping_cart,
                            label: 'ตะกร้าสินค้า',
                            onPressed: () {
                              // TODO Cart action
                            },
                          ),
                          const SizedBox(width: 10),
                          BottomActionButton(
                            icon: Icons.smart_toy,
                            label: 'ปรึกษา AI',
                            onPressed: () {
                              // TODO AI consultation action
                              context.pushNamed(RouteName.aiAssistantPage.name);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String brandName;
  final double price;
  final String detail;
  final List<String>? images;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.brandName,
    required this.price,
    required this.detail,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   height: 80,
          //   width: 80,
          //   color: Colors.grey[200],
          //   child: const Icon(Icons.image, size: 40, color: Colors.grey),
          // ),
          ResponsiveImage(
            imageUrl,
            assetType: AssetType.network,
            baseHeight: 80,
            baseWidth: 80,
            themeDirectory: "",
            themeName: "",
          ),
          const SizedBox(height: 10),
          Text(brandName, style: const TextStyle(fontSize: 16)),
          Text('฿ $price', style: const TextStyle(fontSize: 16)),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              // TODO Handle add to cart
              context.pushNamed(
                RouteName.productInformationPage.name,
                extra: ProductInformationPageArguments(
                    images: images,
                    productInformation: detail,
                    brandName: brandName,
                    price: price,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BottomActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const BottomActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        minimumSize: const Size(150, 50),
      ),
      icon: Icon(icon, color: Colors.black),
      label: Text(label, style: const TextStyle(color: Colors.black)),
    );
  }
}

//TODO for chatBot
Future<void> openMethodBottomSheet({
  required BuildContext context,
}) async {
  const scaleHeight = 690.0;
  await showPopup(
    context: context,
    child: PopupLayout(
      title: "chatbot.view.chatbot_page.upload_attachment_bottom_sheet_title".tr(),
      child: Container(),
    ),
    size: MediaQuery.of(context).size.height <= scaleHeight ? PopupSize.half : PopupSize.medium,
  ).then((_) async {});
}
