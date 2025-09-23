import 'dart:async';
import 'package:dokan_retailer/Screens/bottom_bar_screen/homescreen/product_detail1.dart';
import 'package:dokan_retailer/Screens/bottom_bar_screen/homescreen/wheat.dart';
import 'package:dokan_retailer/Screens/notification.dart';
import 'package:dokan_retailer/Services/banner.dart';
import 'package:dokan_retailer/Services/product.dart';
import 'package:dokan_retailer/models/banner/bannerlist.dart';
import 'package:dokan_retailer/models/product/product_list.dart';
import 'package:dokan_retailer/providers/category_provider.dart';
import 'package:dokan_retailer/providers/token_provider.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../models/category.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController search = TextEditingController();
  bool isLoading = false;

  late PageController _pageController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Initialize page controller
    _pageController = PageController();

    // Auto-slide every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.toInt() + 1;
        final banners = context.read<Bannerlist>().banners ?? [];
        if (nextPage >= banners.length) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });

    // Load categories once when widget is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CategoryProvider>(context, listen: false).loadCategories();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tokenProvider = Provider.of<TokenProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.5),
          child: Image.asset(
            "Assets/images/dashboard.png",
            scale: 2.2,
            height: 24,
            width: 24,
          ),
        ),
        title: const Text(
          "Dokan",
          style: TextStyle(
            fontSize: 21.18,
            fontFamily: 'KronaOne',
            fontWeight: FontWeight.w400,
            color: Color(0xFFFF5934),
            letterSpacing: -1.74,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const notification()),
                );
              },
              child: Image.asset(
                "Assets/images/notification.png",
                height: 24,
                width: 24,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner Section
            LoadingOverlay(
              isLoading: isLoading,
              child: FutureProvider.value(
                value: BannerListService().getBanners(tokenProvider.getToken()),
                initialData: Bannerlist(),
                builder: (context, child) {
                  Bannerlist bannerListingModel = context.watch<Bannerlist>();
                  final banners = bannerListingModel.banners;

                  if (banners == null || banners.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return SizedBox(
                    height: 190,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: banners.length,
                      itemBuilder: (context, index) {
                        final item = banners[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Container(
                            width: double.infinity,
                            height: 181,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(item.image ?? ''),
                                fit: BoxFit.cover, // ✅ full cover
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: search,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      "Assets/images/search.png",
                      height: 24,
                      width: 24,
                    ),
                  ),
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    color: Color(0xFFADADAF),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "inter",
                    letterSpacing: -1,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFEEF0F6),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryProvider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : categoryProvider.categoryModelList == null ||
                      categoryProvider.categoryModelList!.categories.isEmpty
                      ? const Center(child: Text("No categories found"))
                      : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                    categoryProvider.categoryModelList!.categories.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      final Category category = categoryProvider
                          .categoryModelList!.categories[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              wheat(name: category.name,
                                image: category.image,),
                            ),
                          );

                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.grey[200],
                              backgroundImage: (category.image.isNotEmpty)
                                  ? NetworkImage(category.image)
                                  : null,
                              child: (category.image.isEmpty)
                                  ? const Icon(Icons.image_not_supported)
                                  : null,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              category.name,
                              style: const TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  // recommended

                  Text("Recommended for you", style: TextStyle(fontSize: 18, fontFamily: 'inter',
                      fontWeight: FontWeight.w600, color: Color(0xFF121212),letterSpacing: -1),),
                  SizedBox(height: 35,),


                  FutureBuilder<Productlistmodel?>(
                    future: ProductService().fetchProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data == null || snapshot.data!.products == null || snapshot.data!.products!.isEmpty) {
                        return const Center(child: Text("No products found"));
                      }

                      final products = snapshot.data!.products!;

                      return Column(
                        children: List.generate(
                          (products.length / 2).ceil(),
                              (rowIndex) {
                            final start = rowIndex * 2;
                            final end = (start + 2 <= products.length) ? start + 2 : products.length;
                            final rowProducts = products.sublist(start, end);

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: rowProducts.map((product) {
                                  return Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductDetailsPage(product: product),
                                          ),
                                        );
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(right: 10),
                                            height: 129,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              image: product.image != null
                                                  ? DecorationImage(
                                                image: NetworkImage(product.image!),
                                                fit: BoxFit.cover,
                                              )
                                                  : null,
                                              color: Colors.grey[200],
                                            ),
                                          ),
                                          Positioned(
                                            right: 10,
                                            top: 10,
                                            child: const CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Icon(Icons.favorite_border, color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
