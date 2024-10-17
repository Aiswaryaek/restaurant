// import 'dart:io';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:restaurant/utiles/app_screen_util.dart';



// Future<void> generatePaySlipPDF(
//   String grandTotal,
//   String orderId,
//   String orderDate,
//   String deliveryDate,
//   String buyerName,
//   String houseNO,
//   String apartmentNo,
//   String landMark,
//   String city,
//   String contactNumber,
//   // List<List<dynamic>> tableData,
// ) async {
//   ///Table titles
//   final headers = [
//     'Product',
//     'Qty',
//     'Bag Total',
//     'Coupon Discount',
//     'Delivery Charge',
//     'Total Amount'
//   ];
//   // final data = tableData;

//   // final Uint8List imageData =
//   //     (await rootBundle.load(ImageCons.accounts)).buffer.asUint8List();

//   // final logoImage = pw.MemoryImage(imageData);

//   final double columnWidth = 100.0; // Width for each column

//   // final tableHeadersWidgets = headers.map((header) {
//   //   return pw.Container(
//   //     alignment: pw.Alignment.centerLeft,
//   //     child: pw.Text(
//   //       header,
//   //       style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//   //     ),
//   //     padding: const pw.EdgeInsets.all(5),
//   //     margin: const pw.EdgeInsets.all(5),
//   //     width: columnWidth, // Apply the column width to the Container
//   //   );
//   // }).toList();

//   // final tableRowsWidgets = data.map((row) {
//   //   return row.map((cell) {
//   //     return pw.Container(
//   //       alignment: pw.Alignment.centerLeft,
//   //       child: pw.Text(cell),
//   //       padding: const pw.EdgeInsets.all(5),
//   //       margin: const pw.EdgeInsets.all(5),
//   //       width: columnWidth, // Apply the column width to the Container
//   //     );
//   //   }).toList();
//   // }).toList();

//   // final tableWidgets = <pw.TableRow>[
//   //   pw.TableRow(children: tableHeadersWidgets),
//   //   ...tableRowsWidgets.map((row) => pw.TableRow(children: row)),
//   // ];

//   // final tableWidget = pw.Table(
//   //   border: null,
//   //   defaultColumnWidth: pw.FixedColumnWidth(columnWidth),
//   //   children: tableWidgets,
//   // );

//   final pdf = pw.Document();
//   pdf.addPage(
//     pw.MultiPage(
//       pageFormat: PdfPageFormat(
//         PdfPageFormat.a4.width,
//         PdfPageFormat.a4.height,
//         marginAll: 0,
//       ),
//       build: (pw.Context context) {
//         return [
//           ///Top section of invoice
//           pw.Padding(
//               padding: const pw.EdgeInsets.only(
//                 left: 12.0,
//                 right: 12.0,
//                 top: 22,
//               ),
//               child: pw.Column(
//                 children: [
//                   pw.Column(
//                       crossAxisAlignment: pw.CrossAxisAlignment.center,
//                       children: [
//                         pw.Text(
//                           'Invoice',
//                           style: pw.TextStyle(
//                               fontSize:18,
//                               fontWeight: pw.FontWeight.bold,
//                               color: PdfColor.fromHex('#000000')),
//                         ),
//                       ]),
//                   pw.SizedBox(height: 10),
//                   pw.Row(
//                     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: pw.CrossAxisAlignment.start,
//                     children: [
//                       // pw.Image(logoImage, width: 90, height: 90),

//                       // pw.Column(
//                       //     mainAxisAlignment: pw.MainAxisAlignment.start,
//                       //     crossAxisAlignment: pw.CrossAxisAlignment.start,
//                       //     children: [
//                       //       pw.Text(
//                       //         'Sold By : Sample Company Limited,',
//                       //         style: pw.TextStyle(
//                       //           fontSize:16,
//                       //           color: PdfColor.fromHex('#000000'),
//                       //           fontWeight: pw.FontWeight.bold,
//                       //         ),
//                       //       ),
//                       // pw.SizedBox(height: 3.0),

//                       // pw.Row(children: [
//                       //   pw.Text(
//                       //     'Ship from address :',
//                       //     style: pw.TextStyle(
//                       //         fontSize:12,
//                       //         color: PdfColor.fromHex('#000000'),
//                       //         fontWeight: pw.FontWeight.bold,
//                       //         fontStyle: pw.FontStyle.italic),
//                       //   ),
//                       //   pw.SizedBox(width: 3.0),

//                       //   ///Seller first address line
//                       //   pw.Text(
//                       //     'House care sample address kakkanad po, kochi,',
//                       //     style: pw.TextStyle(
//                       //         fontSize:10,
//                       //         color: PdfColor.fromHex('#000000'),
//                       //         fontStyle: pw.FontStyle.italic),
//                       //   ),
//                       // ]),
//                       // pw.SizedBox(height: 3.0),

//                       // ///Seller sceond address line
//                       // pw.Text(
//                       //   'Pincode 691008',
//                       //   style: pw.TextStyle(
//                       //       fontSize:10,
//                       //       color: PdfColor.fromHex('#000000'),
//                       //       fontStyle: pw.FontStyle.italic),
//                       // ),
//                       // ]),

//                       ///Qr code
//                       pw.Container(
//                         width: 90.0,
//                         height: 90.0,
//                         child: pw.BarcodeWidget(
//                           data:
//                               'Order ID: $orderId\nOrder Date: $orderDate\nDelivery Date: $deliveryDate\nBuyer name: $buyerName\nHouse no: $houseNO\nApartment no: $apartmentNo\nContact no: $contactNumber\nGrand total : $grandTotal'
//                           // 'Invoice Number: $invoiceNumber\nProduct Name: $productName\nPrice: $productPrice'
//                           ,
//                           barcode: pw.Barcode.qrCode(),
//                           width: 75.0,
//                           height: 75.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                   pw.SizedBox(height: 8.0),
//                   pw.Container(
//                     child: pw.Divider(
//                       thickness: 1.0,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                   pw.SizedBox(height: 8.0),

//                   ///Order details
//                   pw.Row(
//                       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                       children: [
//                         pw.Container(
//                             // width: 90.0,
//                             // height: 90.0,
//                             child: pw.Column(
//                                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                                 children: [
//                               ///Order id
//                               pw.Text(
//                                 'Order ID : $orderId',
//                                 style: pw.TextStyle(
//                                   fontSize:16,
//                                   color: PdfColor.fromHex('#000000'),
//                                   fontWeight: pw.FontWeight.bold,
//                                 ),
//                               ),
//                               pw.SizedBox(height: 8.0),

//                               ///Order date
//                               pw.Row(children: [
//                                 pw.Text(
//                                   'Order Date :',
//                                   style: pw.TextStyle(
//                                     fontSize:16,
//                                     color: PdfColor.fromHex('#000000'),
//                                     fontWeight: pw.FontWeight.bold,
//                                   ),
//                                 ),
//                                 pw.SizedBox(width: 3.0),
//                                 pw.Text(
//                                   orderDate,
//                                   style: pw.TextStyle(
//                                     fontSize:16,
//                                     color: PdfColor.fromHex('#000000'),
//                                   ),
//                                 ),
//                               ]),
//                               pw.SizedBox(height: 8.0),

//                               ///Delivery date
//                               pw.Row(children: [
//                                 pw.Text(
//                                   'Delivery Date :',
//                                   style: pw.TextStyle(
//                                     fontSize:16,
//                                     color: PdfColor.fromHex('#000000'),
//                                     fontWeight: pw.FontWeight.bold,
//                                   ),
//                                 ),
//                                 pw.SizedBox(width: 3.0),
//                                 pw.Text(
//                                   deliveryDate,
//                                   style: pw.TextStyle(
//                                     fontSize:16,
//                                     color: PdfColor.fromHex('#000000'),
//                                   ),
//                                 ),
//                               ]),
//                             ])),

//                         ///Billing address
//                         pw.Container(
//                             width: AppScreenUtil().screenWidth(200),
//                             child: pw.Column(
//                                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                                 children: [
//                                   ///Title
//                                   pw.Text(
//                                     'Delivery Address :',
//                                     style: pw.TextStyle(
//                                       fontSize:16,
//                                       color: PdfColor.fromHex('#000000'),
//                                       fontWeight: pw.FontWeight.bold,
//                                     ),
//                                   ),
//                                   pw.SizedBox(height: 3.0),

//                                   ///Delivery address
//                             pw.Column(
//                                           crossAxisAlignment:
//                                               pw.CrossAxisAlignment.start,
//                                           children: [
//                                               ///Buyer Name
//                                               pw.Text(
//                                                 buyerName,
//                                                 style: pw.TextStyle(
//                                                   fontSize:16,
//                                                   color: PdfColor.fromHex(
//                                                       '#000000'),
//                                                   fontWeight:
//                                                       pw.FontWeight.bold,
//                                                 ),
//                                               ),
//                                               pw.SizedBox(height: 3.0),
// /////
//                                               ///House No
//                                               pw.Row(
//                                                   mainAxisAlignment: pw
//                                                       .MainAxisAlignment.start,
//                                                   children: [
//                                                     pw.Text(
//                                                       'House No :',
//                                                       style: pw.TextStyle(
//                                                         fontSize:16,
//                                                         color: PdfColor.fromHex(
//                                                             '#000000'),
//                                                         fontWeight:
//                                                             pw.FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                     pw.SizedBox(width: 3.0),
//                                                     pw.Text(
//                                                       houseNO,
//                                                       style: pw.TextStyle(
//                                                         fontSize:16,
//                                                         color: PdfColor.fromHex(
//                                                             '#000000'),
//                                                       ),
//                                                     ),
//                                                   ]),
//                                               pw.SizedBox(height: 3.0),

//                                               ///Apartment No
//                                               pw.Row(
//                                                   mainAxisAlignment: pw
//                                                       .MainAxisAlignment.start,
//                                                   children: [
//                                                     pw.Text(
//                                                       'Apartment No :',
//                                                       style: pw.TextStyle(
//                                                         fontSize:16,
//                                                         color: PdfColor.fromHex(
//                                                             '#000000'),
//                                                         fontWeight:
//                                                             pw.FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                     pw.SizedBox(width: 3.0),
//                                                     pw.Text(
//                                                       apartmentNo,
//                                                       style: pw.TextStyle(
//                                                         fontSize:16,
//                                                         color: PdfColor.fromHex(
//                                                             '#000000'),
//                                                       ),
//                                                     ),
//                                                   ]),
//                                               pw.SizedBox(height: 3.0),

//                                               ///Land mark
//                                               pw.Text(
//                                                 landMark,
//                                                 style: pw.TextStyle(
//                                                   fontSize:16,
//                                                   color: PdfColor.fromHex(
//                                                       '#000000'),
//                                                 ),
//                                               ),
//                                               pw.SizedBox(height: 3.0),

//                                               ///City
//                                               pw.Text(
//                                                 city,
//                                                 style: pw.TextStyle(
//                                                   fontSize:16,
//                                                   color: PdfColor.fromHex(
//                                                       '#000000'),
//                                                 ),
//                                               ),
//                                               pw.SizedBox(height: 3.0),

//                                               ///Contact number
//                                               pw.Row(
//                                                   mainAxisAlignment: pw
//                                                       .MainAxisAlignment.start,
//                                                   children: [
//                                                     pw.Text(
//                                                       'Contact No :',
//                                                       style: pw.TextStyle(
//                                                         fontSize:16,
//                                                         color: PdfColor.fromHex(
//                                                             '#000000'),
//                                                         fontWeight:
//                                                             pw.FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                     pw.SizedBox(width: 3.0),
//                                                     pw.Text(
//                                                       contactNumber,
//                                                       style: pw.TextStyle(
//                                                         fontSize:16,
//                                                         color: PdfColor.fromHex(
//                                                             '#000000'),
//                                                       ),
//                                                     ),
//                                                   ]),
//                                             ])
//                                 ])),

//                         ///
//                         pw.Container(
//                             child: pw.Column(
//                                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                                 children: [
//                               pw.Text(
//                                 '*Keep this invoice and',
//                                 style: pw.TextStyle(
//                                   fontSize:12,
//                                   color: PdfColor.fromHex('#000000'),
//                                 ),
//                               ),
//                               pw.SizedBox(height: 6.0),
//                               pw.Text(
//                                 'manufacturer box for',
//                                 style: pw.TextStyle(
//                                   fontSize:12,
//                                   color: PdfColor.fromHex('#000000'),
//                                 ),
//                               ),
//                               pw.SizedBox(height: 6.0),
//                               pw.Text(
//                                 'warranty purposes',
//                                 style: pw.TextStyle(
//                                   fontSize:12,
//                                   color: PdfColor.fromHex('#000000'),
//                                 ),
//                               ),
//                             ])),
//                       ]),
//                   pw.SizedBox(height: 8.0),
//                   pw.Container(
//                     child: pw.Divider(
//                       thickness: 1.0,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                   //////
//                 ],
//               )),
//           pw.SizedBox(height: 8.0),

//           ///Product details table

//           pw.SizedBox(height: 8.0),

//           // pw.Padding(
//           //     padding: const pw.EdgeInsets.only(
//           //       left: 12.0,
//           //       right: 12.0,
//           //       top: 5,
//           //     ),
//           //     child: tableWidget),
//           pw.SizedBox(height: 8.0),

//           ///Bottom section of invoice
//           pw.Padding(
//             padding: const pw.EdgeInsets.only(
//               left: 12.0,
//               right: 12.0,
//               bottom: 8.0,
//             ),
//             child: pw.Column(children: [
//               pw.Container(
//                 child: pw.Divider(
//                   thickness: 1.0,
//                   color: PdfColors.black,
//                 ),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.end,
//                   children: [
//                     ///Grand total
//                     pw.Row(
//                         mainAxisAlignment: pw.MainAxisAlignment.end,
//                         children: [
//                           pw.Text(
//                             'Grand Total',
//                             style: pw.TextStyle(
//                               fontSize:20,
//                               color: PdfColor.fromHex('#000000'),
//                             ),
//                           ),
//                           pw.SizedBox(width: 20.0),
//                           pw.Text(
//                             "Smaple",
//                             // grandTotal,
//                             style: pw.TextStyle(
//                               fontSize:16,
//                               color: PdfColor.fromHex('#000000'),
//                               fontWeight: pw.FontWeight.bold,
//                             ),
//                           ),
//                         ]),
//                     // pw.SizedBox(height: 10.0),

//                     // ///Company Name
//                     // pw.Text(
//                     //   'Sample Company Limited',
//                     //   style: pw.TextStyle(
//                     //     fontSize:16,
//                     //     color: PdfColor.fromHex('#000000'),
//                     //   ),
//                     // ),
//                   ]),
//               pw.SizedBox(height: 20.0),
//               pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
//                 pw.Text(
//                   'Authorized Signatory',
//                   style: pw.TextStyle(
//                     fontSize:14,
//                     color: PdfColor.fromHex('#000000'),
//                   ),
//                 ),
//               ]),
//               pw.SizedBox(height: 1.5),
//               pw.Container(
//                 child: pw.Divider(
//                   thickness: 1.0,
//                   color: PdfColors.black,
//                 ),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Align(
//                 alignment: pw.Alignment.bottomRight,
//                 child: pw.Column(
//                     mainAxisAlignment: pw.MainAxisAlignment.end,
//                     crossAxisAlignment: pw.CrossAxisAlignment.start,
//                     children: [
//                       // pw.Image(logoImage, width: 50, height: 50),
//                       pw.SizedBox(height: 1.5),
//                       pw.Column(children: [
//                         pw.Text(
//                           'Thank You!',
//                           style: pw.TextStyle(
//                             fontSize:16,
//                             color: PdfColor.fromHex('#000000'),
//                             fontWeight: pw.FontWeight.bold,
//                           ),
//                         ),
//                         pw.Text(
//                           'for shopping with us',
//                           style: pw.TextStyle(
//                             fontSize:10,
//                             color: PdfColor.fromHex('#000000'),
//                           ),
//                         ),
//                       ])
//                     ]),
//               ),
//             ]),
//           )
//         ];
//       },
//     ),
//   );


//    final directory = await getApplicationDocumentsDirectory();
//   final path = '${directory.path}/Tax_invoice.pdf';

//   final File file = File(path);
//   await file.writeAsBytes(await pdf.save());

//   OpenFile.open(path);
// }