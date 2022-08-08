import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/constant/constant.dart';
import 'package:mmbl/controller/filter_form_controller.dart';
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
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white,size: 35,),
          centerTitle: true,
          title: const Text("မြန်မာပြည်စီးပွား‌ရေးလမ်းညွှန်",
          style: TextStyle(color: Colors.white,)),
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
        drawer: Container(),
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