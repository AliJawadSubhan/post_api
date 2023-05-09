import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:post_data/home/home_controller.dart';
import 'package:post_data/model/post_model.dart';
import 'package:post_data/model/user_model.dart';

import '../repositry/send_data_repo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Controller controller = Controller();
  final _formKey = GlobalKey<FormState>();
  UserModel? _user;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Data to API'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Builder(builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(labelText: 'name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.jobController,
                  decoration: InputDecoration(labelText: 'Job'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a job';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () async {
                    UserModel user = await controller.postUserTap(context);
                    setState(() {
                      _user = user;
                      isLoading = controller.isLOading;
                    });
                  },
                  child: isLoading
                      ? Text('Send Data')
                      : CircularProgressIndicator(),
                ),
                _user == null
                    ? Container()
                    : Text(controller.usermodel!.name.toString())
              ],
            );
          }),
        ),
      ),
    );
  }
}
