// ignore: file_names
// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

Widget DefultFormField({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  bool isClickable = true,
  Function? onSubmit,
  Function? onChange,
  Function? validate,
  Function? SuffixPressed,
  required String lable,
  required IconData Prefix,
  IconData? Suffix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: (s){validate!(s);},
      onChanged: (s){onChange!(s);},
      decoration: InputDecoration(
        labelText: '${lable}',
        prefixIcon: Icon(Prefix),
        suffixIcon:Suffix!=null? IconButton(icon:Icon(Suffix),onPressed: (){SuffixPressed!();},):null,
        border: OutlineInputBorder(),
      ),
      onFieldSubmitted: (s){onSubmit!(s);},
    );


Widget DefultTextButton ({
  required Function function,
  required String text ,
})=>TextButton(onPressed: (){function!();}, child: Text('${text.toUpperCase()}'));