import 'package:get/get.dart';

import '../controller/add_business_controller.dart';

class AddBusinessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddBusinessController());
  }
  
}