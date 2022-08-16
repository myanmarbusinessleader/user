import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/constant/constant.dart';
import 'package:mmbl/controller/filter_form_controller.dart';
import 'package:mmbl/utils/router/router.dart';
import 'package:mmbl/utils/widgets/custom_elevated_button.dart';
import '../business_filter_screen.dart';
import '../widgets/filter_search.dart';
import '../widgets/top_search_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FilterFormController controller = Get.find();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //TopSearchBar Enteprise Name
              TopSearchBar(size: size, controller: controller),
              //FilterSearch
              FilterSearch(controller: controller),
            ],
          ),
        ),
      ),
     /*  bottomNavigationBar: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,),
                          child: CustomElevatedButton(
                            height: 50,
                          color: Colors.amber,
                          text: "ADD YOUR BUSINESS LISTING IN HERE! +", 
                          buttonPressed: () => Get.toNamed(addBusinessScreen),
                          ),
                        ), */
    );
  }
}
