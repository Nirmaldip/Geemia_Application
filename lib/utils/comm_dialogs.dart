// // import 'package:flutter/material.dart';
// // import 'package:kaya/utils/values/colors.dart';
//
// class CommDialogs{
//   static void showProgressDialog(BuildContext context) {
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return WillPopScope(
//             onWillPop: () async {
//               return false /*true*/;
//             },
//             child: Theme(
//               data: Theme.of(context)
//                   .copyWith(dialogBackgroundColor: Colors.transparent),
//               child: Dialog(
//                 elevation: 0,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Container(
//                   color: Colors.transparent,
//                   margin: EdgeInsets.all(45),
//                   width: 60,
//                   height: 50,
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Center(
//                           child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(primaryColor)),
//                         ),
//                       ]),
//                 ),
//               ),
//             ),
//           );
//         });
//
// //    return Container();
//   }
//
//   static Future<void> showCustomDialogBox({
//     required BuildContext context,
//     required String title,
//     required String message,
//     VoidCallback? onOkPressed,
//   }) async {
//     await showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext dialogContext) {
//         return WillPopScope(
//           onWillPop: () async => false,
//           child: Dialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(title,
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       )),
//                   const SizedBox(height: 10),
//                   Text(message, textAlign: TextAlign.center),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(dialogContext).pop();
//                       if (onOkPressed != null) onOkPressed();
//                     },
//                     child: const Text("OK"),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
// }