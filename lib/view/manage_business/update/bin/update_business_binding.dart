import 'package:get/get.dart';
import 'package:mmbl/view/manage_business/update/controller/update_business_controller.dart';

class UpdateBusinessBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(UpdateBusinessController());
  }
}