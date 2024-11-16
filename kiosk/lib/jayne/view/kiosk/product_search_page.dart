import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/blocs/product_bloc/product_cubit.dart';
import 'package:kiosk/jayne/blocs/product_bloc/product_state.dart';
import 'package:kiosk/jayne/components/atoms/widget_spacer.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';
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

  static const mobileConst = "mobile";
  static const tabletConst = "tablet";
  static const notebookConst = "notebook";
  static const smartwatchConst = "smartwatch";
  static const earphoneConst = "earphone";
  static const accessoriesConst = "accessories";
  static const recommendConst = "recommend";

  @override
  void initState() {
    isSelectRecommendTab = true;
    isSelectMobileTab = false;
    isSelectTabletTab = false;
    isSelectNotebookTab = false;
    isSelectSmartWatchTab = false;
    isSelectEarPhoneTab = false;
    isSelectAccessoriesTab = false;
    context.read<ProductCubit>().getProductOnAWSBedrock(inputText: "ขอข้อมูล promotion", minPrice: 30000, maxPrice: 99999);
    super.initState();
  }

  String getPrompt({
    required String type,
    required String selectBrandName,
    required String selectUsage,
    required String selectPrice,
  }) {
    switch (type) {
      case mobileConst:
        return 'แนะนำมือถือ $selectBrandName';
      case tabletConst:
        return 'แนะนำแท็บเล็ต $selectBrandName';
      case notebookConst:
        return 'แนะนำโน๊ตบุ๊ค $selectBrandName';
      case smartwatchConst:
        return 'แนะนำสมาร์ทวอช $selectBrandName';
      case earphoneConst:
        return 'แนะนำหูฟัง $selectBrandName';
      case accessoriesConst:
        return 'แนะนำ accessories $selectBrandName';
      default:
        return 'แนะนำมือถือ $selectBrandName';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> mobileList = [
      'Aukey',
      'Xiaomi iOT',
      'Samsung',
      'Oppo',
      'Apple',
      'Vivo',
      'Huawei',
      'Xiaomi',
      'realme',
      'Infinix',
      'Acefast',
      'Anker',
      'Commy',
      'Kakudos',
      'Fenix Shield',
      'Belkin',
      'Kate Spade',
      'Ugreen',
      'Veger',
      'Honor',
      'Asus',
      'Acer',
      'HP',
      'Dell',
    ];

    final priceItems = ['10000', '20000', '30000', '40000'].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<ProductCubit, ProductState>(
        key: const Key("product_search_page"),
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) async {},
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // Side Menu
                      const WidgetSpacer(size: 16),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 4),
                                  decoration: BoxDecoration(
                                    color: isSelectRecommendTab ? Colors.red : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.recommend,
                                      color: isSelectRecommendTab ? Colors.white : Colors.black,
                                    ),
                                    title: Text(
                                      'jayne.product_recommend_page.recommend_tab'.tr(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: isSelectRecommendTab ? Colors.white : Colors.black,
                                      ),
                                    ),
                                    onTap: () {
                                      final textPrompting = getPrompt(
                                        type: recommendConst,
                                        selectBrandName: selectedBrand ?? "",
                                        selectUsage: selectedUsage ?? "",
                                        selectPrice: selectedPrice ?? "99999",
                                      );
                                      context.read<ProductCubit>().getProductOnAWSBedrock(
                                            inputText: textPrompting,
                                            minPrice: 30000,
                                            maxPrice: int.parse(selectedPrice ?? "99999"),
                                          );
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
                                    color: isSelectMobileTab ? Colors.red : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.smartphone,
                                      color: isSelectMobileTab ? Colors.white : Colors.black,
                                    ),
                                    title: Text(
                                      'jayne.product_recommend_page.mobile_tab'.tr(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: isSelectMobileTab ? Colors.white : Colors.black,
                                      ),
                                    ),
                                    onTap: () {
                                      final textPrompting = getPrompt(
                                        type: mobileConst,
                                        selectBrandName: selectedBrand ?? "",
                                        selectUsage: selectedUsage ?? "",
                                        selectPrice: selectedPrice ?? "99999",
                                      );
                                      context.read<ProductCubit>().getProductOnAWSBedrock(
                                            inputText: textPrompting,
                                            minPrice: 30000,
                                            maxPrice: int.parse(selectedPrice ?? "99999"),
                                          );
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
                                    color: isSelectTabletTab ? Colors.red : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.tablet,
                                      color: isSelectTabletTab ? Colors.white : Colors.black,
                                    ),
                                    title: Text(
                                      'jayne.product_recommend_page.tablet_tab'.tr(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: isSelectTabletTab ? Colors.white : Colors.black,
                                      ),
                                    ),
                                    onTap: () {
                                      final textPrompting = getPrompt(
                                        type: tabletConst,
                                        selectBrandName: selectedBrand ?? "",
                                        selectUsage: selectedUsage ?? "",
                                        selectPrice: selectedPrice ?? "99999",
                                      );
                                      context.read<ProductCubit>().getProductOnAWSBedrock(
                                            inputText: textPrompting,
                                            minPrice: 30000,
                                            maxPrice: int.parse(selectedPrice ?? "99999"),
                                          );
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
                                    color: isSelectNotebookTab ? Colors.red : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.computer,
                                      color: isSelectNotebookTab ? Colors.white : Colors.black,
                                    ),
                                    title: Text(
                                      'jayne.product_recommend_page.notebook_tab'.tr(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: isSelectNotebookTab ? Colors.white : Colors.black,
                                      ),
                                    ),
                                    onTap: () {
                                      final textPrompting = getPrompt(
                                        type: notebookConst,
                                        selectBrandName: selectedBrand ?? "",
                                        selectUsage: selectedUsage ?? "",
                                        selectPrice: selectedPrice ?? "99999",
                                      );
                                      context.read<ProductCubit>().getProductOnAWSBedrock(
                                            inputText: textPrompting,
                                            minPrice: 30000,
                                            maxPrice: int.parse(selectedPrice ?? "99999"),
                                          );
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
                                    color: isSelectSmartWatchTab ? Colors.red : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.watch,
                                      color: isSelectSmartWatchTab ? Colors.white : Colors.black,
                                    ),
                                    title: Text(
                                      'jayne.product_recommend_page.smartwatch_tab'.tr(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: isSelectSmartWatchTab ? Colors.white : Colors.black,
                                      ),
                                    ),
                                    onTap: () {
                                      final textPrompting = getPrompt(
                                        type: smartwatchConst,
                                        selectBrandName: selectedBrand ?? "",
                                        selectUsage: selectedUsage ?? "",
                                        selectPrice: selectedPrice ?? "99999",
                                      );
                                      context.read<ProductCubit>().getProductOnAWSBedrock(
                                            inputText: textPrompting,
                                            minPrice: 30000,
                                            maxPrice: int.parse(selectedPrice ?? "99999"),
                                          );
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
                                    color: isSelectEarPhoneTab ? Colors.red : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.earbuds,
                                      color: isSelectEarPhoneTab ? Colors.white : Colors.black,
                                    ),
                                    title: Text(
                                      'jayne.product_recommend_page.earphones_tab'.tr(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: isSelectEarPhoneTab ? Colors.white : Colors.black,
                                      ),
                                    ),
                                    onTap: () {
                                      final textPrompting = getPrompt(
                                        type: earphoneConst,
                                        selectBrandName: selectedBrand ?? "",
                                        selectUsage: selectedUsage ?? "",
                                        selectPrice: selectedPrice ?? "99999",
                                      );
                                      context.read<ProductCubit>().getProductOnAWSBedrock(
                                            inputText: textPrompting,
                                            minPrice: 30000,
                                            maxPrice: int.parse(selectedPrice ?? "99999"),
                                          );
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
                                    color: isSelectAccessoriesTab ? Colors.red : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.headset,
                                      color: isSelectAccessoriesTab ? Colors.white : Colors.black,
                                    ),
                                    title: Text(
                                      'jayne.product_recommend_page.accessories_tab'.tr(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: isSelectAccessoriesTab ? Colors.white : Colors.black,
                                      ),
                                    ),
                                    onTap: () {
                                      final textPrompting = getPrompt(
                                        type: accessoriesConst,
                                        selectBrandName: selectedBrand ?? "",
                                        selectUsage: selectedUsage ?? "",
                                        selectPrice: selectedPrice ?? "99999",
                                      );
                                      context.read<ProductCubit>().getProductOnAWSBedrock(
                                            inputText: textPrompting,
                                            minPrice: 30000,
                                            maxPrice: int.parse(selectedPrice ?? "99999"),
                                          );
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
                      ),

                      // Product Grid with Filters
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Filters
                              Row(
                                children: [
                                  Expanded(
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        labelText: 'jayne.product_individual_page.select_brand'.tr(),
                                        border: const OutlineInputBorder(),
                                        filled: true,
                                        fillColor: Colors.grey.shade200,
                                      ),
                                      value: selectedBrand,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedBrand = newValue;
                                          context.read<ProductCubit>().updateSelectBrand(selectBrandName: selectedBrand ?? "");
                                        });
                                      },
                                      items: mobileList.map((String value) {
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
                                        filled: true,
                                        fillColor: Colors.grey.shade200,
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
                                        'Social Media',
                                        'ถ่ายรูป',
                                        'งานธุรกิจ',
                                      ].map((String value) {
                                        context.read<ProductCubit>().updateSelectUsage(selectUsage: selectedUsage ?? "");
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
                                        filled: true,
                                        fillColor: Colors.grey.shade200,
                                      ),
                                      value: priceItems.any((item) => item.value == selectedPrice) ? selectedPrice : null,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedPrice = newValue;
                                        });
                                      },
                                      items: priceItems,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      final selectBrandName = state.selectBrandName;
                                      final selectUsage = state.selectUsage;
                                      final selectPrice = state.selectPrice;
                                      setState(() {
                                        selectedBrand = selectBrandName;
                                        selectedUsage = selectUsage;
                                        selectedPrice = selectPrice.toString();
                                      });
                                      ServiceProvider().requestProduct(
                                        userContent: '',
                                        botContent: '',
                                        inputText: 'ช่วยแนะนำ $selectBrandName ใช้ในการ$selectUsage',
                                        minPrice: 1000,
                                        maxPrice: state.selectPrice,
                                        minDiscountPc: 0,
                                        minDiscountValue: 0,
                                        minPoint: 0,
                                      );
                                    },
                                    icon: const Icon(Icons.search),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              // Product Grid //
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.productInfo?.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: ProductCard(
                                        imageUrl: state.productInfo?[index].imageUrl ?? "",
                                        brandName: state.productInfo?[index].brandName ?? "Iphone",
                                        price: state.productInfo?[index].price ?? 0.0,
                                        detail: state.productInfo?[index].detail ?? "",
                                        images: state.productInfo?[index].images ?? [],
                                      ),
                                    );
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
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey.shade100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 80,
                        ),
                        onPressed: () {
                          context.pop();
                        },
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  child: const ResponsiveImage(
                                    'assets/images/shopping.json',
                                    assetType: AssetType.animation,
                                    baseWidth: 120,
                                  ),
                                  onTap: () {
                                    //TODO Test
                                    context.pushNamed(
                                      RouteName.productInformationPage.name,
                                      extra: ProductInformationPageArguments(
                                        images: ["https://static-jaymart.com/ecom/public/2YZHC6Q2CNSL1mVMfmbv3XW6zXV.jpg"],
                                        productInformation: "",
                                        brandName: "",
                                        price: 0,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(8.0)),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  child: const ResponsiveImage(
                                    'assets/images/chatbot.json',
                                    assetType: AssetType.animation,
                                    baseWidth: 120,
                                  ),
                                  onTap: () {
                                    context.pushNamed(RouteName.aiAssistantPage.name);
                                  },
                                ),
                              ],
                            ),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ResponsiveImage(
            imageUrl,
            assetType: AssetType.network,
            baseHeight: 200,
            baseWidth: 200,
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
