import 'package:get/get.dart';
import 'package:mmbl/view/manage_business/controller/manage_business_controller.dart';

class ManageBusinessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ManageBusinessController());
  }
  
}