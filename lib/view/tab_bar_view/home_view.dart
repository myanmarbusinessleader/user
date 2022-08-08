import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/controller/filter_form_controller.dart';
import 'package:mmbl/utils/router/router.dart';
import 'package:mmbl/utils/widgets/custom_elevated_button.dart';
import '../widgets/filter_search.dart';
import '../widgets/top_search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FilterFormController controller = Get.find();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          //TopSearchBar Enteprise Name
          TopSearchBar(size: size, controller: controller),
          //FilterSearch
          FilterSearch(controller: controller),
           //Siz Categories Widget
           Expanded(
             child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 10),
                child: ListView(
                  children: [
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 3/4,
                          ),
                        itemCount: 6, 
                        itemBuilder: (context,index){
                          return   Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Image
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10)
                                      )
                                    ),
                                  ),
                                  //Text
                                  const Text("ဟိုတယ်များonfoasd",style: TextStyle(color: Colors.grey,
                                  ),textAlign: TextAlign.center,)
                                ],
                              );
                        },
                    ),
                    //Bottom Elevated
                    CustomElevatedButton(
        color: Colors.blueAccent,
                    text: "ADD YOUR BUSINESS LISTING IN HERE! +", 
                    buttonPressed: () => Get.toNamed(addBusinessScreen),
                    ),
                  ],
                ),
              ),
           ),
          //Adding Business Listing Button
        ],
      ),
    );
  }
}
