
import 'package:dokan_retailer/Screens/Auth/login.dart';
import 'package:dokan_retailer/Screens/bottom_bar_screen/homescreen/wheat.dart';
import 'package:dokan_retailer/models/model.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  TextEditingController search = TextEditingController();

  List<GridItem> gridItems = [
    GridItem(name: "Rice", image: "Assets/images/rice.png"),
    GridItem(name: "Wheat", image: "Assets/images/wheat.png",page: wheat()),
    GridItem(name: "Oats", image: "Assets/images/oats.png"),
    GridItem(name: "Barley", image: "Assets/images/barley.png"),
    GridItem(name: "Corn", image: "Assets/images/corn.png"),
    GridItem(name: "Wheat", image: "Assets/images/wheat.png"),
    GridItem(name: "Oats", image: "Assets/images/oats.png"),
    GridItem(name: "Barley", image: "Assets/images/barley.png"),
    GridItem(name: "Corn", image: "Assets/images/corn.png"),
    GridItem(name: "Show All", image: "Assets/images/showall.png"),
  ];


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.5),
          child: Image.asset(
            scale: 2.2,
            "Assets/images/dashboard.png",height: 24,width: 24,

          ),
        ),
        title: Text("Dokan", style: TextStyle(fontSize: 21.18, fontFamily: 'KronaOne',
            fontWeight: FontWeight.w400, color: Color(0xFFFF5934),letterSpacing: -1.74),),
          centerTitle: true,

          actions: [

            Padding(
              padding: const EdgeInsets.only(right: 20.5),
              child: Image.asset("Assets/images/notification.png",height: 24,width: 24,),
            ),]
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("Assets/images/bigsale.png", ),SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: TextField(
              controller: search,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset("Assets/images/search.png", height: 24,width: 24,),
                ),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Color(0xFFADADAF),
                  fontSize: 16, fontWeight: FontWeight.w500, fontFamily: "inter", letterSpacing: -1
                ),
                filled: true,
                fillColor: Color(0xFFEEF0F6),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),

              ),
                        ),
            ),
              SizedBox(height: 20,),

              //Gridview

              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 230,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: gridItems.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5, // 5 in each row
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 14,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) {
                          final item = gridItems[index];
                          return InkWell(
                            onTap: () {
                              if (item.page != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => item.page!),
                                );
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  item.image,
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 4),
                                Text(item.name,
                                  style: TextStyle(color: index == gridItems.length - 1
                                        ? Color(0xFFFF5934) : Color(0xFF000000),
                                    fontSize: 14, fontWeight: FontWeight.w500, fontFamily: "inter", letterSpacing: -1

                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Text("Recommended for you", style: TextStyle(fontSize: 18, fontFamily: 'inter',
                        fontWeight: FontWeight.w600, color: Color(0xFF121212),letterSpacing: -1),),
                    SizedBox(height: 35,),

                    Row(
                      children: [
                        Image.asset("Assets/images/row1.png", height: 129,width: 167,),
                        SizedBox(width: 18,),
                        Image.asset("Assets/images/row1.png", height: 129,width: 167,),
                      ],
                    ),
                    SizedBox(height: 18,),

                    Row(
                      children: [
                        Image.asset("Assets/images/row1.png", height: 129,width: 167,),
                        SizedBox(width: 18,),
                        Image.asset("Assets/images/row1.png", height: 129,width: 167,),
                      ],
                    )
                  ],
                ),
              ),



          ],
        ),
      ),


    );
  }
}
