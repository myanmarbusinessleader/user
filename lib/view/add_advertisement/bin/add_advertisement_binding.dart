import 'package:get/get.dart';
import 'package:mmbl/view/add_advertisement/controller/add_advertisement.dart';

class AddAdvertisementBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AddAdvertisementController());
  }

}