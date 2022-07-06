import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeapp/pages/admin/list_company_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AddComPage extends StatefulWidget {
  @override
  _AddComPageState createState() => _AddComPageState();
}

class _AddComPageState extends State<AddComPage> {
  final _formKey = GlobalKey<FormState>();

  var companyName = "";
  var email = "";
  var password = "";
  var y1 = "";
  var y2 = "";
  var y3 = "";
  var y4 = "";
  var y5 = "";
  var y6 = "";
  var y7 = "";
  var y8 = "";
  var y9 = "";
  var y10 = "";
  var y11 = "";
  var y12 = "";
  var y13 = "";
  var y14 = "";
  var y15 = "";
  var y16 = "";
  var y17 = "";
  var y18 = "";
  var y19 = "";
  var y20 = null;

  var r1 = "";
  var r2 = "";
  var r3 = "";
  var r4 = "";
  var r5 = "";
  var r6 = "";
  var r7 = "";
  var r8 = "";
  var r9 = "";
  var r10 = "";
  var r11 = "";
  var r12 = "";
  var r13 = "";
  var r14 = "";
  var r15 = "";
  var r16 = "";
  var r17 = "";
  var r18 = "";
  var r19 = "";
  var r20 = null;
  


  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final companyNameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    companyNameController.dispose();
    super.dispose();
  }

  clearText() {
    companyNameController.clear();
  }

  // Adding Com
  CollectionReference company = FirebaseFirestore.instance.collection('company');

  // Future<void> addUser() {
  //   return company
  //       .add({'name': companyName})
  //       .then((value) => print('User Added'))
  //       .catchError((error) => print('Failed to Add user: $error'));
  // }

  // Future<void> addCompany(){
  //   return company.add({'companyName' : companyName}); 
  // }
//---------------------------- Adding an Entry -----------------------------------------------//
  Future<void> addField()  {
    return company
    .add({
      "companyName" : companyName,
      "returns":{
        y1:r1,
        y2:r2
      },
    })
    .then((value) => print('Company Added'))
    .catchError((error) => {print('Idhar hai error $error')});
}

push(){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListCompanyPage()));
}

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    var children2 = [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Name: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ), 
                  controller: companyNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                  onChanged: (value){
                    companyName = value;
                    setState(() {});
                  },
                ),
              ),
            ),

            
            
          
          
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        onChanged: (value) {
                          y1 = value;
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        onChanged: (value) {
                          r1 = value;
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          y2 = value;
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          r2 = value;
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        onChanged: (value){
                          y3 = value;
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: (value){
                          r3 = value;
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          y5 = value;
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          y6 = value;
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(),
                    ),
                    Expanded(
                      child: Text(
                        ":",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => {addField(), push()},
                child: Text(
                  'Add Company',
                  style: TextStyle(fontSize: 18.0),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              ),
            ),
          ];
    return Scaffold(
        appBar: AppBar(
          title: Text("Add a new company"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: children2,
          ),
        )
      );
  }
}
