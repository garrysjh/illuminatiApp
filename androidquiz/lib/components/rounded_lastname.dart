import 'package:flutter/material.dart';

import 'text_field_container.dart';
import '../constants.dart';

class RoundedLastname extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
   const RoundedLastname({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon, 
            color: kPrimaryColor,
          ),
          hintText: "Last Name",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildInputField(String hintText, BuildContext context){
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon, 
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
  }


