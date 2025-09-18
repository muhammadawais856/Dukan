// import 'package:dokan_retailer/models/banner/bannerlist.dart';
// import 'package:dokan_retailer/providers/token_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:internshipproject2/Widgets/textfield.dart';
// import 'package:internshipproject2/midel/bannermodellist.dart';
// import 'package:internshipproject2/notifications.dart';
// import 'package:internshipproject2/provider/token.dart';
// import 'package:internshipproject2/provider11/provider.dart' show CategoryProvider;
// import 'package:internshipproject2/services/bannerservices.dart';
// import 'package:internshipproject2/wheat.dart';
// import 'package:loading_overlay/loading_overlay.dart';
// import 'package:provider/provider.dart';
// import 'package:internshipproject2/midel/categorylisrmodel.dart';
//
// import 'Services/banner.dart';
//
// class home extends StatefulWidget {
//   const home({super.key});
//
//   @override
//   State<home> createState() => _homeState();
// }
//
// class _homeState extends State<home> {
//   bool isLoading = false;
//   TextEditingController name = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() =>
//         Provider.of<CategoryProvider>(context, listen: false).loadCategories());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var tokenProvider = Provider.of<TokenProvider>(context);
//     final categoryProvider = Provider.of<CategoryProvider>(context);
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           "Dokan",
//           style: TextStyle(
//             fontSize: 21.18,
//             fontWeight: FontWeight.w400,
//             color: Color(0xffFF5934),
//             letterSpacing: -1.74,
//             fontFamily: "KronaOne",
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 20.5),
//             child: IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => notification()),
//                 );
//               },
//               icon: Image.asset(
//                 'assets/images/alaram.png',
//                 height: 19.11,
//                 width: 17.62,
//               ),
//             ),
//           ),
//         ],
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 20.5),
//           child: IconButton(
//             onPressed: () {},
//             icon: Image.asset(
//               'assets/images/dot.png',
//               height: 24,
//               width: 24,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             LoadingOverlay(
//               isLoading: isLoading,
//               child: FutureProvider.value(
//                 value: BannerListService().getBanners(tokenProvider.getToken()),
//                 initialData: Bannerlist(),
//                 builder: (context, child) {
//                   Bannerlist bannerListingModel =
//                   context.watch<Bannerlist>();
//                   return bannerListingModel.banners == null
//                       ? Center(child: CircularProgressIndicator())
//                       : SizedBox(
//                     height: 190,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: bannerListingModel.banners?.length ?? 0,
//                       itemBuilder: (context, index) {
//                         final item = bannerListingModel.banners![index];
//                         return Padding(
//                           padding: const EdgeInsets.only(
//                             left: 24,
//                             right: 24,
//                           ),
//                           child: Container(
//                             width: 380,
//                             height: 181,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               image: DecorationImage(
//                                 image: NetworkImage(item.image ?? ''),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: customTextField(
//                 hintText: "Search",
//                 controller: name,
//                 prefixImage: "assets/images/serach.png",
//               ),
//             ),
//             const SizedBox(height: 20),
//
//             /// ✅ Category Grid from Backend
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: categoryProvider.isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : categoryProvider.categoryModelList == null ||
//                   categoryProvider.categoryModelList!.categories == null ||
//                   categoryProvider
//                       .categoryModelList!.categories!.isEmpty
//                   ? const Center(child: Text("No categories found"))
//                   : GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: categoryProvider
//                     .categoryModelList!.categories!.length,
//                 gridDelegate:
//                 const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 5,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                   childAspectRatio: 0.75,
//                 ),
//                 itemBuilder: (context, index) {
//                   final Category category = categoryProvider
//                       .categoryModelList!.categories![index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Wheat()));
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                             content: Text(
//                                 "${category.name ?? "Unknown"} clicked")),
//                       );
//                     },
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         CircleAvatar(
//                           radius: 28,
//                           backgroundColor: Colors.grey[200],
//                           backgroundImage: (category.image != null &&
//                               category.image!.isNotEmpty)
//                               ? NetworkImage(category.image!)
//                               : null,
//                           child: (category.image == null ||
//                               category.image!.isEmpty)
//                               ? const Icon(Icons.image_not_supported)
//                               : null,
//                         ),
//                         const SizedBox(height: 6),
//                         Text(
//                           category.name ?? "Unnamed",
//                           style: const TextStyle(fontSize: 12),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.only(right: 170),
//               child: Text(
//                 "Recommended for you",
//                 style: TextStyle(
//                   fontSize: 18,
//                   letterSpacing: -1,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 20, left: 20),
//               child: Row(
//                 children: [
//                   Image.asset("assets/images/111.png", height: 129, width: 167),
//                   SizedBox(width: 10),
//                   Image.asset("assets/images/111.png", height: 129, width: 167),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 20, left: 20),
//               child: Row(
//                 children: [
//                   Image.asset("assets/images/111.png", height: 129, width: 167),
//                   SizedBox(width: 10),
//                   Image.asset("assets/images/111.png", height: 129, width: 167),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }