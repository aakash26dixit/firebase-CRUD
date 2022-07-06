class AdminModel{
  String? uid;
  String? email;
  String? firstName;
  String? secondName;

  AdminModel({this.uid, this.email, this.firstName, this.secondName});


  //Recieving Data from the server
  factory AdminModel.fromMap(map){
    return AdminModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName']
    );
  }

  //Sending Data to the server
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName
    };
  }

}