import 'package:get/get.dart';
import 'package:mmbl/view/business_detail/business_detail_screen.dart';
import 'package:mmbl/view/add_business/bin/add_business_binding.dart';
import 'package:mmbl/view/add_business/view/add_business_listing.dart';
import 'package:mmbl/view/manage_categories/bin/manage_category_binding.dart';
import 'package:mmbl/view/manage_categories/view/manage_categories_screen.dart';

import '../../view/home_screen.dart';

const homeScreen = "/home_screen";
const addBusinessScreen = "/add_business_screen";
const businessDetailScreen = "/business_detail_screen";
const manageCategoriesScreen = "/manage_categories_screen";


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
];