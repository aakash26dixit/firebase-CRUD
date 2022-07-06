// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// class ListcompanyPage extends StatefulWidget {
//   ListcompanyPage({Key? key}) : super(key: key);

//   @override
//   _ListcompanyPageState createState() => _ListcompanyPageState();
// }

// class _ListcompanyPageState extends State<ListcompanyPage> {
//   final Stream<QuerySnapshot> companyStream =
//       FirebaseFirestore.instance.collection('company').snapshots();

//   // For Deleting User
//   CollectionReference company =
//       FirebaseFirestore.instance.collection('company');
//   Future<void> deleteUser(id) {
//     // print("User Deleted $id");
//     return company
//         .doc(id)
//         .delete()
//         .then((value) => print('User Deleted'))
//         .catchError((error) => print('Failed to Delete user: $error'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//         stream: companyStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             print('Something went Wrong');
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           final List storedocs = [];
          
//           // snapshot.data!.docs.map((DocumentSnapshot document) {
//           //   Map a = document.data() as Map<dynamic, dynamic>;
//           //   storedocs.add(a);
//           // }).toList();

//           return Container(
//             margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Table(
//                 border: TableBorder.all(),
//                 columnWidths: const <int, TableColumnWidth>{
//                   1: FixedColumnWidth(140),
//                 },
//                 defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//                 children: [
//                   TableRow(
//                     children: [
//                       TableCell(
//                         child: Container(
//                           color: Colors.greenAccent,
//                           child: Center(
//                             child: Text(
//                               'Name',
//                               style: TextStyle(
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Container(
//                           color: Colors.greenAccent,
//                           child: Center(
//                             child: Text(
//                               'Email',
//                               style: TextStyle(
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Container(
//                           color: Colors.greenAccent,
//                           child: Center(
//                             child: Text(
//                               'Action',
//                               style: TextStyle(
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   for (var i = 0; i < storedocs.length; i++) ...[
//                     TableRow(
//                       children: [
//                         TableCell(
//                           child: Center(
//                               child: Text(storedocs[i]['companyName'],
//                                   style: TextStyle(fontSize: 18.0))),
//                         ),
//                         TableCell(
//                           child: Center(
//                               child: Text(storedocs[i]['returns.2001'],
//                                   style: TextStyle(fontSize: 18.0))),
//                         ),
//                         TableCell(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               IconButton(
//                                 onPressed: () => {
//                                   deleteUser(
//                                     storedocs[i]['id']
//                                   )
//                                 },
//                                 icon: Icon(
//                                   Icons.delete,
//                                   color: Colors.red,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           );
//         }
//       );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
  
// class ListCompanyPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AddData(),
//     );
//   }
// }
  
// class AddData extends StatelessWidget {

//   bool changeSize = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: const Text("List"),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('company').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           return ListView(
//             children: snapshot.data!.docs.map((document) {
//               return InkWell(
//                 child: ListTile(
//                   title: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       document["companyName"],
//                       style: const TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// class ListCompanyPage extends StatefulWidget {
//   const ListCompanyPage({ Key? key }) : super(key: key);

//   @override
//   _ListCompanyPageState createState() => _ListCompanyPageState();
// }

// class _ListCompanyPageState extends State<ListCompanyPage> {
  
//   var company = FirebaseFirestore.instance.collection('company').snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('company').snapshots(),
//         builder: (context, snapshot) { 
//           if (!snapshot.hasData) {
//             return CircularProgressIndicator();
//           }    
//           return ListView(
//             children: [
//               ListTile(
                
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ListCompanyPage extends StatefulWidget {
  const ListCompanyPage({ Key? key }) : super(key: key);

  @override
  _ListCompanyPageState createState() => _ListCompanyPageState();
}

class _ListCompanyPageState extends State<ListCompanyPage> {
  
  
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("List"),
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('company').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              return InkWell(
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          document['companyName'],
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          document["returns.2000"],
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}