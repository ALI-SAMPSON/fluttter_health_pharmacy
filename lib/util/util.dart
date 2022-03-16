

import 'package:dro_health_pharmacy/util/colors.dart';
import 'package:flutter/material.dart';

final roundedCornerShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0));

final straightCornerShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0));

final circularButtonStyleSolid = RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0));

final roundButtonStyleSolid = ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(12)),
    backgroundColor: MaterialStateProperty.all<Color>(colorDroPurple),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0),)
    )
);

// final circularButtonStyleSolid = ButtonStyle(
//     padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(12)),
//     backgroundColor: MaterialStateProperty.all<Color>(colorDroPurple),
//     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//         RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0),)
//     )
// );

final bottomSheetStyle = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(14), topRight: Radius.circular(14)
  )
);