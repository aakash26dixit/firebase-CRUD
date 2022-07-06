// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:collegeapp/pages/content.dart';
// import 'package:collegeapp/pages/services/reviewCompany.dart';
// import 'package:flutter/material.dart';
// import 'package:collegeapp/companyData/companiesData.jsx' as company1;


// class contentNext extends StatefulWidget {
  
//   final String companyName;
//   final String amount;
//   final String initialYear;
//   final String finalYear;

//   contentNext({required this.companyName, required this.amount, required this.initialYear, required this.finalYear });

//   @override
//   _contentNextState createState() => _contentNextState(companyName, amount, initialYear, finalYear);
// }

// class _contentNextState extends State<contentNext> {

//   String companyName;
//   String amount;
//   String initialYear;
//   String finalYear;

//   _contentNextState({required this.companyName, required this.amount, required this.initialYear, required this.finalYear});
//   var reviews;
//   List<String> reviews1= [];
  
  
  
//   @override
//   void initState(){
//     super.initState();
//     // ReviewCompany()
//     // .getCurrentCompany('amazon')
//     // .then((QuerySnapshot docs) {
//     //   if(docs.docs.isNotEmpty){
//     //     // reviews = docs.docs[0].data;
//     //     reviews = docs.docs[0].data();  
//     //   }
//     //   reviews.forEach((field) {
//     //     field.documents.asMap().forEach((index, data) {
//     //       // reviews1 = field.documents[index][2000];
//     //       reviews1.add(field.documents[index][2000]);
//     //     });
//     //   });
//     //   });
//     Stream<QuerySnapshot> review = 
//       Firestore.instance
//       .collection("company")
//       .where('companyName', isEqualTo: companyName)
//       .get();

//   // } 

//   //═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
                     
//   @override 
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Text(reviews1[1])
//           Text(reviews1.first)
//         ],
//       ),
//     );
//   }
// } 

// //══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════