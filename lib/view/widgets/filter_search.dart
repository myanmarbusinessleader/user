
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/filter_form_controller.dart';
import '../../utils/widgets/filter_row_widget.dart';
import '../business_filter_screen.dart';
import '../filter_screen.dart';

class FilterSearch extends StatelessWidget {
  const FilterSearch({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final FilterFormController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        padding: const EdgeInsets.only(left: 10,right: 20,top: 5),
        child: Column(
          children: [
            Obx(
              () => FilterRowWidget(
              leadingText: "What",
              value: controller.category.value,
              buttonPressed: (){
                Get.to(() => FilterScreen(
                  appBarTitle: "လုပ်ငန်းအမျိုးအစားရွေးချယ်ပါ", 
                  hintText: "လုပ်ငန်းအမျိုးအစား", 
                  search: controller.search, 
                  onSelected: controller.changeCategory,
                  ));
                //Get.toName(filterScreen)
              },
              returnData: (value) => controller.changeCategory(value),
            )
           ),
           Obx(
              () => FilterRowWidget(
              leadingText: "State",
              value: controller.state.value,
              buttonPressed: (){
                 Get.to(() => FilterScreen(
                  appBarTitle: "ပြည်နယ်နှင့်တိုင်းဒေသကြီး ရွေးချယ်ပါ", 
                  hintText: "ပြည်နယ်နှင့်တိုင်း", 
                  search: controller.searchState, 
                  onSelected: controller.changeState,
                  ));
              },
              returnData: (value) => controller.changeState(value),
            )
           ),
           Obx(
              () => FilterRowWidget(
              leadingText: "Township",
              value: controller.township.value,
              buttonPressed: (){
                  if(controller.state.value == allStates){
                        Get.defaultDialog(
                          title: "Warnning!",
                          content: const Text("Please choose state first"),
                        );
                        return;
                      }
                 Get.to(()=> FilterScreen(
                  appBarTitle: "မြို့နယ်ရွေးချယ်ပါ", 
                  hintText: "မြို့နယ်", 
                  search: controller.searchTownship, 
                  onSelected: controller.changeTownship,
                  ));
              },
              returnData: (value) => controller.changeTownship(value),
            )
           ),
           //Search Button
           Padding(
             padding: const EdgeInsets.only(left: 20,right: 20),
             child: SizedBox(
              width: double.infinity,
               child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {
                  Get.to(() => BusinessFilterScreen(
                  appBarTitle: controller.category.value, 
                  hintText: "လုပ်ငန်းအမည်", 
                  search: controller.searchBusiness, 
                  onSelected: (value){
                    debugPrint("*********GO TO: ${value.name} page");
                  },
                  ));
                }, 
                child: const Text(
                  "ရှာရန်",
                  style: TextStyle(color: Colors.white,),
                ),
                ),
             ),
           ),
          ],
        ),);
  }
}

