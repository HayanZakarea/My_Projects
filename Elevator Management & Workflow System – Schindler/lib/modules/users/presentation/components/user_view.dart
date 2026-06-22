import 'package:flutter/material.dart';
import 'package:elevator_management_app/modules/users/data/models/user_model.dart';

class UserView extends StatelessWidget {
  final UserModel model;
  const UserView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text(model.name),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text(model.email),
            subtitle: Text('verified at : ${model.emailVerifiedAt ?? '-'}'),
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Role : ${model.roles.firstOrNull?.name}'),
          ),

        ],
      ),
    );
  }
}
