import 'package:get/get.dart';
import 'package:mmbl/view/add_advertisement/bin/add_advertisement_binding.dart';
import 'package:mmbl/view/add_advertisement/view/add_advertisement_view.dart';
import 'package:mmbl/view/business_detail/business_detail_screen.dart';
import 'package:mmbl/view/add_business/bin/add_business_binding.dart';
import 'package:mmbl/view/add_business/view/add_business_listing.dart';
import 'package:mmbl/view/manage_business/bin/manage_business_binding.dart';
import 'package:mmbl/view/manage_business/update/bin/update_business_binding.dart';
import 'package:mmbl/view/manage_business/update/view/update_business_view.dart';
import 'package:mmbl/view/manage_business/view/manage_business_view.dart';
import 'package:mmbl/view/manage_categories/bin/manage_category_binding.dart';
import 'package:mmbl/view/manage_categories/view/manage_categories_screen.dart';

import '../../view/home_screen.dart';

const homeScreen = "/home_screen";
const addBusinessScreen = "/add_business_screen";
const businessDetailScreen = "/business_detail_screen";
const manageCategoriesScreen = "/manage_categories_screen";
const manageAdvertisementsScreen = "/manage_advertisement_screen";
const updateBusinessScreen = "/update_business_screen";
const manageBusinessScreen = "/manage_business_screen";

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: homeScreen, 
    page:() => const HomeScreen()
    ),
  GetPage(
    name: addBusinessScreen, 
    binding: AddBusinessBinding(),
    page:() => const AddingBusinessListingScreen()
    ),
  GetPage(
    name: businessDetailScreen, 
    page:() => const BusinessDetailScreen()
    ),
  GetPage(
    name: manageCategoriesScreen, 
    binding: ManageCategoriesBinding(),
    page:() => const ManageCategoriesScreen()
    ),
  GetPage(
    name: manageAdvertisementsScreen, 
    binding: AddAdvertisementBinding(),
    page:() => const ManageAdvertisementView()
    ),
  GetPage(
    name: manageBusinessScreen, 
    binding: ManageBusinessBinding(),
    page:() => const ManageBusinessView()
    ),
  GetPage(
    name: updateBusinessScreen, 
    binding: UpdateBusinessBinding(),
    page:() => const UpdateBusinessView()
    ),
];