import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokedex_app/core/styles/style_color.dart';
import 'package:pokedex_app/core/styles/style_text.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String) onChanged;
  const AppbarWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: StyleColor.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      title: TextFormField(
        autofocus: false,
        style: StyleText.regular(fontSize: 14.0, colorText: StyleColor.grey99),
        textInputAction: TextInputAction.search,
        onChanged: (value) {
          onChanged(value);
        },
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 13.5),
          fillColor: StyleColor.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          hintText: 'Find the Pokemon',
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 20,
          ),
          prefixIconColor: StyleColor.grey66,
          hintStyle:
              StyleText.regular(fontSize: 14.0, colorText: StyleColor.grey99),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Container(
          color: StyleColor.whiteF2,
          height: 1.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(88);
}
