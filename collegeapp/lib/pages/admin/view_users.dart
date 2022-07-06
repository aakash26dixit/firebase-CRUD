import 'package:collegeapp/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class viewUsers extends StatefulWidget {
  
  @override
  viewUsersState createState() => viewUsersState();
}

class viewUsersState extends State<viewUsers> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView.builder(
      //   itemCount: docs.length,
      //   itemBuilder: itemBuilder
      // ),
    );
  }
}
