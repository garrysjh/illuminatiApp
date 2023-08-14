import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:androidquiz/main.dart';

var currentUser = CurrentUser(0, "", "", "", "");



class CurrentUser {
   
    int id = 0;

String username = "";

String firstname = "";

String lastname = "";

String mobile = "";

 CurrentUser(int id, String username, String firstname, String lastname, String mobile) {
        this.id = id;
        this.username = username;
        this.firstname = firstname;
        this.lastname = lastname;
        this.mobile = mobile;
    }
    Future<String> checkName() async{
  final response = await http.post(
    Uri.parse('${URL}/user/verify'),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, int>{
        'id': currentUser.getId()
    }),
  );
  if (response == null) {
    print("noresponse");
    return response.body;
  }
  else {
    print("First Name of User: ${response.body}");
    currentUser.setFirstname(response.body);
    return response.body;
  }
}

     int getId() {
        return id;
    }

    void setId(int newid) {
      this.id = newid;
    }

    String getUsername() {
        return username;
    }

    void setUsername(String newusername) {
        this.username = newusername;
    }

     String getFirstname() {
        return firstname;
    }

     void setFirstname(String newfirstname) {
        this.firstname = newfirstname;
    }

     String getLastname() {
        return lastname;
    }

     void setLastname(String newlastname) {
        this.lastname = newlastname;
    }

     String getMobile() {
        return mobile;
    }

     void setMobile(String newmobile) {
        this.mobile = newmobile;
    }
}
