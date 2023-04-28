import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_getx/core/constant/color.dart';
import 'package:store_getx/core/constant/images_asset.dart';
import 'package:get/get.dart';
import 'package:store_getx/core/constant/routes.dart';

import '../../controller/settings.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller= Get.put(SettingsControllerImp());
    return Container(
      child: ListView(
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(height: Get.width / 3, color: AppColor.primaryColor),
                Positioned(
                    top: Get.width / 3.9,
                    child: Container(
                      padding: const  EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[100],
                        backgroundImage: const AssetImage(AppImageAsset.profile),
                      ),
                    )),
              ]),
          const  SizedBox(height: 60),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  // onTap: () {},
                  trailing:  Switch(onChanged: (val){} ,value: true ),
                  title: const Text("Disable Notificatios"),
                ),
                ListTile(
                  onTap: ()
                  {
                   Get.toNamed(AppRoute.addressView);
                  },
                  trailing: const  Icon(Icons.location_on_outlined),
                  title: const Text("Address"),
                ),
                ListTile(
                  onTap: ()
                  {
                    Get.toNamed(AppRoute.ordersPending);
                  },
                  trailing: const  Icon(Icons.card_travel),
                  title: const Text("Orders"),
                ),
                ListTile(
                  onTap: ()
                  {
                    Get.toNamed(AppRoute.ordersArchive);
                  },
                  trailing: const  Icon(Icons.archive_outlined),
                  title: const Text("Archive Orders"),
                ),
                ListTile(
                  onTap: () {},
                  trailing: const Icon(Icons.help_outline_rounded),
                  title: const Text("About us"),
                ),
                ListTile(
                  onTap: () {},
                  trailing: const Icon(Icons.phone_callback_outlined),
                  title: const Text("Contact us"),
                ),
                ListTile(
                  onTap: () {
                    controller.logOut();
                  },
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.exit_to_app),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}