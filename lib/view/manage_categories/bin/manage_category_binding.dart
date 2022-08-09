import 'package:get/get.dart';
import 'package:mmbl/view/manage_categories/controller/manage_categories_controller.dart';

class ManageCategoriesBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ManageCategoriesController());
  }
}