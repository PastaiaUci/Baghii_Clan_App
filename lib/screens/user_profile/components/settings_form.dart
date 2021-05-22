import 'package:baghii_clan/models/user.dart';
import 'package:baghii_clan/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:baghii_clan/models/user_data_model.dart';
import 'package:baghii_clan/shared/loading.dart';


class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();

  // form values
  String _currentName;


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User_model>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userData = snapshot.data;
                return  Container(
                  color: Color(0xff757575),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'Update your baghiu status.',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                                  
                                    initialValue: userData.name,
                                    validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                                    onChanged: (val) => setState(() => _currentName = val),

                              ),

                            SizedBox(height: 10.0),
                            RaisedButton(
                                color: Colors.pink[400],
                                child: Text(
                                  'Update',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  if(_formKey.currentState.validate()){
                                    await  DatabaseService(uid: user.uid).updateUserData(
                                      _currentName ?? userData.name,
                                      userData.profile_pic,
                                      userData.profile_pic_url
                                    );
                                    Navigator.pop(context);
                                  }
                                }
                            ),
                          ],
                        ),
                      ),
                  ),
                );
        }
        else {
            return Loading();
          }
      }
    );
  }
}