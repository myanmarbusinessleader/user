import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/constant/constant.dart';
import 'package:mmbl/controller/filter_form_controller.dart';
import 'package:mmbl/utils/router/router.dart';
import 'package:mmbl/view/tab_bar_view/categories_view.dart';
import 'package:mmbl/view/tab_bar_view/emergency_view.dart';
import 'package:mmbl/view/tab_bar_view/home_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  final FilterFormController controller = Get.find();
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      controller.changeTabIndex(tabController.index);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white,size: 35,),
          title: const Text("မြန်မာပြည် စီးပွား‌ရေးလမ်းညွှန်",
          style: TextStyle(color: Colors.white,fontSize: 16,)),
          bottom:  TabBar(
            controller: tabController,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white38,
            tabs: 
             const [
            Tab(
              text: "HOME",
            ),
            Tab(
              text: "CATEGORIES",
            ),
            Tab(
              text: "EMERGENCY",
            ),
          ]),
        ),
        drawer: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width*0.8,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  //Top Photo
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue)
                    ),
                    child: Image.network(
                      companyLogo,
                      width: size.width*0.8,
                      height: size.height*0.25,
                    ),
                  ),
                   //FOR ADMIN TO UPLOAD CATEGORY
                  ListTile(
                  onTap: () => Get.toNamed(manageCategoriesScreen),
                    leading: const Icon(Icons.edit,size: 35,color: Colors.black,),
                    title: const Text("Manage Categories",style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
                  ),
                  //About
                 const ListTile(
                    leading: Icon(Icons.group,size: 35,color: Colors.black,),
                    title: Text("About",style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
                  ),
                  //OutGuides
                  const ListTile(
                    leading: Icon(Icons.question_mark_rounded,color: Colors.black,size: 35,),
                    title: Text("Our Guides",style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
                  ),
                  //Exchange Rates
                  const ListTile(
                    leading: Icon(Icons.money,color: Colors.black,size: 35,),
                    title: Text("Exchange Rate",style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
                  ),
                  //Call to advertise with us
                  const ListTile(
                    leading: Icon(Icons.phone,color: Colors.black,size: 35,),
                    title: Text("Call to advertise with us",style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
                  ),
                ],
              ),
            ),
            ),
        ),
        body:  TabBarView(
          controller: tabController,
          children: const [
          HomeView(),
          CategoriesView(),
          EmergencyView(),
        ]),
      );
  }
}