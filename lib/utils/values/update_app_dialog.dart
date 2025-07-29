// import 'dart:io';
// import 'package:flutter/material.dart';
//
// class UpdateAppAlertDialog extends StatelessWidget {
//
//   UpdateAppAlertDialog();
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     String msg;
//     String store = Platform.isAndroid ? 'Google Play Store' : 'App Store';
//     msg = 'You are using an older version of the App. \nPlease update to the latest version from the $store.';
//
//     return WillPopScope(
//       onWillPop: () async {
//         return false;
//       },
//       child: Dialog(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(PADDING_10)),
//         elevation: 0,
//         child: Container(
//           decoration: BoxDecoration(
//             image: const DecorationImage(
//               image: AssetImage('assets/images/variation_back.png'),
//               fit: BoxFit.cover,
//             ),
//             borderRadius: BorderRadius.circular(PADDING_10),
//           ),
//           child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//
//               children: [
//                 SizedBox(height: 5,),
//                 Padding(
//                   padding: EdgeInsets.all(PADDING_5),
//                   child: Image.asset(
//                     'assets/images/bhavnaq_text_icon.png',
//                     color: textBlackColor,
//                     height: 60,
//                     width: 150,
//                     fit: BoxFit.contain, // Ensures the image scales well
//                   ),
//                 ),
//                 Container(
//                   width: double.maxFinite,
//                   padding: EdgeInsets.only(
//                       left: PADDING_5, right: PADDING_5, bottom: PADDING_10),
//                   child: Text('App Update Available',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: H2,
//                           fontFamily: 'Manrope',
//                           color: textBlackColor,
//                           fontWeight: FontWeight.w700)),
//                 ),
//                 Container(
//                   width: double.maxFinite,
//                   padding:
//                   EdgeInsets.only(left: PADDING_5, right: PADDING_5, bottom: PADDING_10),
//                   child: Text(msg,
//                       textAlign: TextAlign.center, style: TextStyle(fontSize: H4,
//                           fontFamily:'Manrope',color: textColor)),
//                 ),
//                 Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   _buildButton(UPDATE_APP, () {
//                     StoreRedirect.redirect(iOSAppId: "6723898577");
//                   }),
//                 ]),
//
//               ]),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildButton(String title, Function onPressed) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: MARGIN_2, vertical: MARGIN_5),
//       child: ElevatedButton(
//         style: ButtonStyle(
//             shape: WidgetStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(BORDER_RADIUS_10),
//                 )),
//             backgroundColor:
//             WidgetStateProperty.resolveWith((Set<WidgetState> states) {
//               if (states.contains(WidgetState.pressed)) return primaryColor;
//               return primaryColor;
//             })),
//         child: Padding(
//           padding: EdgeInsets.all(PADDING_5),
//           child: Text(title, style: const TextStyle( fontFamily: 'General Sans',
//             fontSize: 16,
//             color: Colors.white,
//             fontWeight: FontWeight.w600, )),
//         ),
//         onPressed: () => onPressed(),
//       ),
//     );
//   }
// }
//
//
