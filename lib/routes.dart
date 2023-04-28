
import 'package:store_getx/core/constant/routes.dart';
import 'package:store_getx/view/address/add.dart';
import 'package:store_getx/view/address/view.dart';
import 'package:store_getx/view/screen/cart.dart';
import 'package:store_getx/view/screen/check_out.dart';
import 'package:store_getx/view/screen/items.dart';
import 'package:store_getx/view/screen/auth/forget_password/forget_password.dart';
import 'package:store_getx/view/screen/home_screen.dart';
import 'package:store_getx/view/screen/auth/login.dart';
import 'package:store_getx/view/screen/auth/forget_password/rest_password.dart';
import 'package:store_getx/view/screen/auth/sing_up.dart';
import 'package:store_getx/view/screen/auth/forget_password/verify_code.dart';
import 'package:store_getx/view/screen/auth/verify_code_singUp.dart';
import 'package:store_getx/view/screen/language.dart';
import 'package:store_getx/view/screen/my_favroite.dart';
import 'package:store_getx/view/screen/on_boarding.dart';
import 'package:get/get.dart';
import 'package:store_getx/view/screen/orders/archive.dart';
import 'package:store_getx/view/screen/orders/deteils_orders.dart';
import 'package:store_getx/view/screen/orders/pending.dart';
import 'package:store_getx/view/screen/product_detailes.dart';
import 'package:store_getx/view/screen/settings.dart';
import 'core/middle_ware/my_middle_ware.dart';
List<GetPage<dynamic>>? routes = [
  // start
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),



  // start OnBoarding and auth
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.singUp, page: () => const SingUP()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.restPassword, page: () => const RestPassword()),
  GetPage(name: AppRoute.verifyCodeSingUP, page: () => const VerifyCodeSingUP()),
  // end auth and OnBoarding

  // start home
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productDetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myFavorites, page: () => const MyFavorite()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  // GetPage(name: AppRoute.settings, page: () => const Settings()),
  // end home

  // address
  GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  GetPage(name: AppRoute.addressAdd, page: () => const AddressAdd()),

  //checkOut
  GetPage(name: AppRoute.checkOut, page: () => const CheckOut()),

  // orders
  GetPage(name: AppRoute.checkOut, page: () => const CheckOut()),
  GetPage(name: AppRoute.ordersPending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersArchive, page: () => const OrdersArchive()),
  GetPage(name: AppRoute.ordersDetails, page: () => const OrdersDetails()),



];
