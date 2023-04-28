

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppbar;
  final VoidCallback onPressedSearch;
  final VoidCallback onPressedFavorite;
  final ValueChanged<String> onChanged;
  final TextEditingController myController;
  const CustomAppBar({super.key, required this.titleAppbar, required this.onPressedSearch, required this.onPressedFavorite, required this.onChanged, required this.myController});


  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(children: [
        Expanded(
            child: TextFormField(
              controller: myController,
              onChanged: onChanged,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed:onPressedSearch,
                  ),
                  hintText: titleAppbar,
                  hintStyle: const TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                   filled: true,
                  fillColor: Colors.grey[200]),
            )),
        const SizedBox(width: 10),
        // Container(
        //   decoration: BoxDecoration(
        //       color: Colors.grey[200],
        //       borderRadius: BorderRadius.circular(10)),
        //   width: 60,
        //   padding: const EdgeInsets.symmetric(vertical: 8),
        //   child: IconButton(
        //      onPressed: onPressedIcon,
        //       icon: Icon(
        //         Icons.notifications_active_outlined,
        //         size: 30,
        //         color: Colors.grey[600],
        //       )),
        // ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10)),
          width: 60,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
              onPressed: onPressedFavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: Colors.grey[600],
              )),
        )
      ]),
    );
  }
}
