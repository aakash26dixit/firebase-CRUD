import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReviewCompany {
  getCurrentCompany (String companyName){
    // return FirebaseFirestore.instance
    // .collection("company")
    // .where('companyName', isEqualTo: companyName)
    // .get();
    Future<QuerySnapshot<Map<String, dynamic>>> variable = 
      FirebaseFirestore.instance
        .collection("company")
        .where('companyName', isEqualTo: companyName)
        .get();
    return variable;
  }
} 