import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String path = "";
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: key,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Client information",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                          controller: txtName,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            label: Text("Full Name"),
                            prefixIcon: Icon(Icons.account_circle_outlined),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email is required ";
                            } else if (!RegExp(
                                    "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$")
                                .hasMatch(value)) {
                              return "enter the valid email";
                            }
                            return null;
                          },
                          controller: txtEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              label: Text("Email"),
                              prefixIcon: Icon(Icons.email_outlined)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Mobile No is required";
                            } else if (value!.length != 10) {
                              return "Enter the valid number";
                            }
                            return null;
                          },
                          controller: txtMobile,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              label: Text("Mobile number"),
                              prefixIcon: Icon(Icons.phone_android_outlined)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Profile Picture",
                            style: TextStyle(fontSize: 18),

                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(height: 100,
                            width: 100,
                            child: Stack(
                              fit: StackFit.loose,
                              children: [
                               path.isEmpty? CircleAvatar(
                                 radius: 60,
                                 backgroundColor: Colors.black26,
                               ):CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Colors.black26,
                                    backgroundImage: FileImage(File(path))),
                                Align(
                                  alignment: const Alignment(1.5,1),
                                  child: IconButton(
                                    onPressed: () async {
                                      ImagePicker piker = ImagePicker();
                                      XFile? xfile = await piker.pickImage(
                                          source: ImageSource.camera);
                                      setState(() {
                                        path = xfile!.path;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                FocusScope.of(context).unfocus();
                if(key.currentState!.validate())
                {
                  String name = txtName.text;
                  String email = txtEmail.text;
                  String mobile = txtMobile.text;

               dataList[0]["name"]=name;
               dataList[1]["email"]=email;
               dataList[2]["mobile"]=mobile;

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Data is saved")));
                  txtName.clear();
                  txtEmail.clear();
                  txtMobile.clear();
                  setState(() {
                    Navigator.pushNamed(context, 'product');
                  });
                }

              }, child: const Text("Submit")
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
