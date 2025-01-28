class Users {
  String? email ;
  String? password ;

  Users({this.email , this.password});

  toMap(){
    return {
      "email" : email ,
      "password" : password
    };
  }

  factory Users.fromMap(Map<String, dynamic> map){
    return Users(
      email: map["email"] ,
      password: map["password"]
    );
  }

}