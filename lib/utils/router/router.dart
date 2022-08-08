import 'package:get/get.dart';
import 'package:mmbl/view/add_business/bin/add_business_binding.dart';
import 'package:mmbl/view/add_business/view/add_business_listing.dart';

import '../../view/home_screen.dart';

const homeScreen = "/home_screen";
const addBusinessScreen = "/add_business_screen";


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
];