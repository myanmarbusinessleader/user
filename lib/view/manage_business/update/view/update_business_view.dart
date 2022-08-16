import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/controller/filter_form_controller.dart';
import 'package:mmbl/utils/widgets/business_filterform.dart';
import 'package:mmbl/view/add_business/controller/add_business_controller.dart';
import 'package:mmbl/view/manage_business/update/controller/update_business_controller.dart';

import '../../../../constant/constant.dart';
import '../../../../utils/widgets/business_formfield.dart';
import '../../../../utils/widgets/update_business_formfield.dart';
import '../../../filter_screen.dart';


class UpdateBusinessView extends StatelessWidget {
  const UpdateBusinessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UpdateBusinessController controller = Get.find();
    final FilterFormController fController = Get.find();
    return Scaffold(
      appBar: AppBar(
         title: const Text(
          "Update Businesses",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              wordSpacing: 1
          ),
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Column(
              children: [
                //Name
                Obx(
                   () {
                    return UpdateBusinessFormField(
                      hintText: "Business Name",
                      label: "Business Name (*)",
                      hasError: controller.checkHasError("Business Name"),
                      error: controller.inputMap["Business Name"]!.value!.error,
                      value: controller.inputMap["Business Name"]!.value!.value,
                      onChanged: (value) => controller.formObjectValidation("Business Name",value),
                      );
                  }
                ),
                //Phone
                Obx(
                   () {
                    return UpdateBusinessFormField(
                      hintText: "Business Phone Number",
                      label: "Business Phone Number",
                      hasError: controller.checkHasError("Business Phone Number"),
                      error: controller.inputMap["Business Phone Number"]!.value!.error,
                      value: controller.inputMap["Business Phone Number"]!.value!.value,
                      onChanged: (value) => controller.formObjectValidation("Business Phone Number",value),
                      );
                  }
                ),
                //Email
                Obx(
                   () {
                    return UpdateBusinessFormField(
                      hintText: "Business Email",
                      label: "Business Email",
                      hasError: controller.checkHasError("Business Email"),
                      error: controller.inputMap["Business Email"]!.value!.error,
                      value: controller.inputMap["Business Email"]!.value!.value,
                      onChanged: (value) => controller.formObjectValidation("Business Email",value),
                      );
                  }
                ),
                //Website
                Obx(
                   () {
                    return UpdateBusinessFormField(
                      hintText: "Website",
                      label: "Website",
                      hasError: controller.checkHasError("Website"),
                      error: controller.inputMap["Website"]!.value!.error,
                      value: controller.inputMap["Website"]!.value!.value,
                      onChanged: (value) => controller.formObjectValidation("Website",value),
                      );
                  }
                ),
                //Address
                Obx(
                   () {
                    return UpdateBusinessFormField(
                      hintText: "Business Address",
                      label: "Business Address (*)",
                      hasError: controller.checkHasError("Business Address"),
                      error: controller.inputMap["Business Address"]!.value!.error,
                      value: controller.inputMap["Business Address"]!.value!.value,
                      onChanged: (value) => controller.formObjectValidation("Business Address",value),
                      );
                  }
                ),
                //State
                Obx((){
                  return BusinessFilterForm(
                    label: "State (*)", 
                    value: controller.state.value,
                    error: "State is required", 
                    hasError: controller.state.value == allStates && controller.isFirstTimePress.value,
                    buttonPressed: (){
                      Get.to(() => FilterScreen(
                    appBarTitle: "ပြည်နယ်နှင့်တိုင်းဒေသကြီး ရွေးချယ်ပါ", 
                    hintText: "ပြည်နယ်နှင့်တိုင်း", 
                    search: fController.searchState, 
                    onSelected: controller.setState,
                  ));
                    }, 
                    );
                }),
                //Township
                Obx((){
                  return BusinessFilterForm(
                    label: "Township (*)", 
                    value: controller.township.value,
                    error: "Township is required", 
                    hasError: controller.township.value == allTownship && controller.isFirstTimePress.value,
                    buttonPressed: (){
                      if(controller.state.value == allStates){
                        Get.defaultDialog(
                          title: "Warnning!",
                          content: const Text("Please choose state first"),
                        );
                      }else{
                        Get.to(() => FilterScreen(
                    appBarTitle: "မြို့နယ်ရွေးချယ်ပါ", 
                    hintText: "မြို့နယ်",
                    search: controller.searchTownship, 
                    onSelected: controller.setTownship,
                  ));
                      }
                    }, 
                    );
                }),
                //Category
                Obx((){
                  return BusinessFilterForm(
                    label: "Category (*)", 
                    value: controller.category.value,
                    error: "Category is required", 
                    hasError: controller.category.value == allCategory && controller.isFirstTimePress.value,
                    buttonPressed: (){
                      Get.to(() => FilterScreen(
                    appBarTitle: "လုပ်ငန်းအမျိုးအစားရွေးချယ်ပါ", 
                    hintText: "လုပ်ငန်းအမျိုးအစား",
                    search: fController.search, 
                    onSelected: controller.setCategory,
                  ));
                    }, 
                    );
                }),
                //Contact Name
                Obx(
                   () {
                    return UpdateBusinessFormField(
                      hintText: "Contact Person Name",
                      label: "Contact Person Name (*)",
                      hasError: controller.checkHasError("Contact Person Name"),
                      error: controller.inputMap["Contact Person Name"]!.value!.error,
                      value: controller.inputMap["Contact Person Name"]!.value!.value,
                      onChanged: (value) => controller.formObjectValidation("Contact Person Name",value),
                      );
                  }
                ),
                //Contacct Phone Number
                Obx(
                   () {
                    return UpdateBusinessFormField(
                      hintText: "Contact Phone Number",
                      label: "Contact Phone Number (*)",
                      hasError: controller.checkHasError("Contact Phone Number"),
                      error: controller.inputMap["Contact Phone Number"]!.value!.error,
                      value: controller.inputMap["Contact Phone Number"]!.value!.value,
                      onChanged: (value) => controller.formObjectValidation("Contact Phone Number",value),
                      );
                  }
                ),
                Obx(
                   () {
                    return UpdateBusinessFormField(
                      hintText: "Contact Email",
                      label: "Contact Email",
                      hasError: controller.checkHasError("Contact Email"),
                      error: controller.inputMap["Contact Email"]!.value!.error,
                      value: controller.inputMap["Contact Email"]!.value!.value,
                      onChanged: (value) => controller.formObjectValidation("Contact Email",value),
                      );
                  }
                ),
                //GeoPoint
                Obx((){
                  return BusinessFilterForm(
                    label: "Business Location (*)", 
                    value: controller.geoPoint.isNotEmpty ?
                    "Lat: ${controller.geoPoint[0]},Long: ${controller.geoPoint[1]}" :
                    "Lat: 0,Long: 0",
                    error: "Business Location is required", 
                    hasError: controller.geoPoint.isEmpty && controller.isFirstTimePress.value,
                    buttonPressed: () => controller.getGeopoint(), 
                    );
                }),
                //Business Image
                Obx((){
                  return BusinessFilterForm(
                    label: "Business Logo (*)", 
                    value: controller.businessLogo.isNotEmpty ? 
                    controller.businessLogo.value : fController.editedBL!.businessLogo
                    .imagePath,
                    error: "Business Logo is required", 
                    hasError: false,
                    buttonPressed: () => controller.getImage(), 
                    );
                }),
                Obx(
                   () {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                      ),
                      onPressed: (){
                        if(controller.validate()){
                          controller.updateBusinessListing();
                        }
                      }, 
                      child:controller.isLoading.value ? 
                      const CircularProgressIndicator(color: Colors.white,)
                      : const Text("Update Info"),
                      );
                  }
                ),
              ],
            ),
          ),
        ),
        ),
    );
  }
}
