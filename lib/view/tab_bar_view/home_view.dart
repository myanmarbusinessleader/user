import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/constant/constant.dart';
import 'package:mmbl/controller/filter_form_controller.dart';
import 'package:mmbl/utils/router/router.dart';
import 'package:mmbl/utils/widgets/custom_elevated_button.dart';
import 'package:mmbl/view/widgets/advertisement_widget.dart';
import '../business_filter_screen.dart';
import '../widgets/filter_search.dart';
import '../widgets/top_search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FilterFormController controller = Get.find();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Advertisement
              const AdvertisementWidget(),
               //Size Categories Widget
                Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(top: 10),
                    child: Obx(
                      () {
                        return controller.gridList.isNotEmpty ? 
                            GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 3/4,
                                  ),
                                itemCount: controller.gridList.length, 
                                itemBuilder: (context,index){
                                  final data = controller.gridList[index];
                                  return   InkWell(
                                    onTap: () {
                                      controller.changeState(allStates);
                                      controller.changeTownship(allTownship);
                                      controller.changeCategory(data.name);
                                      Get.to(() => BusinessFilterScreen(
                                    appBarTitle: data.name, 
                                    hintText: "လုပ်ငန်းအမည်", 
                                    search: controller.searchBusiness, 
                                    onSelected: (value){
                                      debugPrint("*********GO TO: ${value.name} page");
                                    },
                                    ));
                                    },
                                    child: Column(
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
                                                ),
                                              ),
                                              child: Card(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: Image.network(data.image ?? "",
                                              fit: BoxFit.cover),
                                                ),
                                              )
                                            ),
                                            //Text
                                          Text(
                                            data.name,
                                           style: const TextStyle(color: Colors.grey,
                                            ),textAlign: TextAlign.center,
                                          ), 
                                          ],
                                        ),
                                  );
                                },
                        ) : const SizedBox();
                      }
                    ),
                  ),
               
              //Adding Business Listing Button
            ],
          ),
        ),
      ),
    );
  }
}
