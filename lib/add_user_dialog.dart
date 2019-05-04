import 'package:flutter/material.dart';
import 'User.dart';

class AddUserDialog
{

  final txtName = TextEditingController();
  final txtEmail = TextEditingController();
  final txtAge = TextEditingController();
  final txtMobile = TextEditingController();
  User user;
  static const TextStyle linkStyle = const TextStyle(color: Colors.blue,decoration: TextDecoration.underline);


  Widget buildAboutDialog(BuildContext context,AddUserCallback _myHomePageState,bool isEdit,User user)
  {
    if(user!=null)
      {
        this.user=user;
        txtName.text=user.name;
        txtAge.text=user.age;
        txtEmail.text=user.email;
        txtMobile.text=user.mobile;
      }

    print("About Dialog Called");

    return AlertDialog(
      title: Text(isEdit?"Edit Detail":"Add New User"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getTextField("Name", txtName),
            _getTextField("Email", txtEmail),
            _getTextField("Age", txtAge),
            _getTextField("Mobile", txtMobile),
            GestureDetector(
              onTap: ()=>OnTap(isEdit, _myHomePageState, context),
              child: Container(
                margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: _getAppBorderButton(isEdit? "Edit" : "Add", EdgeInsets.fromLTRB(0.0, 10.0,0, 10.0)),
              ),
            )
            
          ],
        ),
      ),
    );

  }

  Widget _getTextField(String inputBoxName,TextEditingController inputBoxController)
  {
    return Padding(padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        controller: inputBoxController,
        decoration: InputDecoration(
          hintText: inputBoxName
        ),
      ),
    );
  }

  Widget _getAppBorderButton(String buttonLabel,EdgeInsets margin)
  {
    print("App Border Button Called");
    return Container(
      margin: margin,
      padding: EdgeInsets.all(8.0),
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF28324E)),
          borderRadius: new BorderRadius.all(const Radius.circular(6.0))
      ),
      child: Text(
        buttonLabel,
        style: TextStyle(
          color: const Color(0xFF28324E),
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  User getData(bool isEdit){return User(isEdit ? user.id:"",txtName.text,txtEmail.text,txtAge.text,txtMobile.text);}

  OnTap(bool isEdit, AddUserCallback _myHomePageState,BuildContext context)
  {
    if(isEdit)
      {
        _myHomePageState.updateUser(getData(isEdit));
      }
    else
      {
        _myHomePageState.addUser(getData(isEdit));
      }
    Navigator.of(context).pop();
  }


}
abstract class AddUserCallback
{
  void addUser(User user);
  void updateUser(User user);
}