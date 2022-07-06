import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeapp/model/user_model.dart';
import 'package:collegeapp/pages/contentNext.dart';
import 'package:collegeapp/pages/user/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid ?? "")
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  var db = FirebaseFirestore.instance.collection('company');

  String companyName = "";
  String amount = "";
  String initialYear = "";
  String finalYear = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome ${loggedInUser.firstName}"),
      ),
      endDrawer: Drawer(),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Text(
                    "Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  alignment: Alignment.center
                ),

              SizedBox(
                height: 20
              ),
                
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.green, width: 0.0),
                    ),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.grey,
                    ),
                    labelText: "Enter company name"),
                onChanged: (value) {
                  companyName = value;
                  setState(() {});
                },
              ),

              SizedBox(
                height: 30
              ),

              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.green, width: 0.0),
                    ),
                    prefixIcon: Icon(
                      Icons.money,
                      color: Colors.grey,
                    ),
                    labelText: "Enter amount deposited"),
                onChanged: (value) {
                  amount = value;
                  setState(() {});
                },
              ),

              SizedBox(
                height: 30
              ),

              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.green, width: 0.0),
                    ),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.grey,
                    ),
                    labelText: "Enter depositing year"),
                onChanged: (value) {
                  initialYear = value;
                  setState(() {});
                },
              ),

              SizedBox(
                height: 30
              ),

              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.green, width: 0.0),
                    ),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.grey,
                    ),
                    labelText: "Enter withdrawal year"),
                onChanged: (value) {
                  finalYear = value;
                  setState(() {});
                },
              ),

              SizedBox(
                height: 30
              ),

              InkWell(
                // onTap: () => {
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => contentNext(
                //         companyName: companyName,
                //         amount: amount,
                //         initialYear: initialYear,
                //         finalYear: finalYear
                //       )
                //     )
                //   )
                // },
                child: Container(
                  height: 50,
                  width: 150,
                  child: 
                  Text(
                    "GO!!",
                    style: 
                      TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold
                      ),
                  ),
                  alignment: Alignment.center,
                  decoration: 
                    BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(
                        20,
                      )
                    )
                  ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Login()));
          Navigator.of(context)
              .push(PageRouteBuilder(pageBuilder: (context, animation, _) {
            return Login();
          }));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
