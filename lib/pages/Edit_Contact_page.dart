import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Globals.dart';
import '../models/contact_models.dart';

class Edit_Contact_page extends StatefulWidget {
  const Edit_Contact_page({Key? key}) : super(key: key);

  @override
  State<Edit_Contact_page> createState() => _Edit_Contact_pageState();
}

class _Edit_Contact_pageState extends State<Edit_Contact_page> {
  final ImagePicker _picker = ImagePicker();

  GlobalKey<FormState> EditPageKey = GlobalKey<FormState>();

  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  //TextEditingController ImageController = TextEditingController();

  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  File? image;

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    FirstNameController.text = data.firstName;
    LastNameController.text = data.lastName;
    PhoneNumberController.text = data.phoneNumber;
    EmailController.text = data.email;
    image = data.image;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Contact",
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.check,
                color: Colors.black,
              ),
              onPressed: () {
                if (EditPageKey.currentState!.validate()) {
                  EditPageKey.currentState!.save();

                  Contact c = Contact(
                    firstName: firstName,
                    lastName: lastName,
                    phoneNumber: phoneNumber,
                    email: email,
                    image: image,
                  );

                  int i = Global.allContacts.indexOf(data);

                  Global.allContacts[i] = c;

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      'Contact_page', (route) => false);

                  FirstNameController.clear();
                  LastNameController.clear();
                  PhoneNumberController.clear();
                  EmailController.clear();
                  // ImageController.clear();

                  setState(() {
                    firstName = "";
                    lastName = "";
                    phoneNumber = "";
                    email = "";
                    //image = "" as File?;
                  });
                }
              }),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();

                FirstNameController.clear();
                LastNameController.clear();
                PhoneNumberController.clear();
                EmailController.clear();
                //ImageController.clear();

                setState(() {
                  firstName = '';
                  lastName = '';
                  phoneNumber = '';
                  email = '';
                  //image = '' as File?;
                });
              },
              icon: const Icon(Icons.cancel))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        // alignment: Alignment.center,
        child: Form(
          key: EditPageKey,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Stack(alignment: Alignment.bottomRight, children: [
                  CircleAvatar(
                    backgroundImage: (image != null) ? FileImage(image!) : null,
                    radius: 60,
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    child: (image != null)
                        ? const Text(
                            "",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        : const Text("Add"),
                  ),
                  FloatingActionButton(
                    mini: true,
                    child: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context).pop;
                      showDialog(
                          //barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Choose Photo"),
                              actions: [
                                TextButton(
                                  child:
                                      const Text("Choose photo from Gallery"),
                                  onPressed: () async {
                                    File? pickedPhoto =
                                        (await _picker.pickImage(
                                                source: ImageSource.gallery))
                                            as File?;

                                    setState(() {
                                      image = File(pickedPhoto!.path);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                  child: const Text("Choose photo from Camera"),
                                  onPressed: () async {
                                    File? clickedPhoto =
                                        (await _picker.pickImage(
                                                source: ImageSource.camera))
                                            as File?;

                                    setState(() {
                                      image = File(clickedPhoto!.path);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          });
                    },
                  ),
                ]),
              ),
              Expanded(
                  flex: 12,
                  child: SingleChildScrollView(
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("First name"),
                          const SizedBox(
                            height: 5,
                          ),
                          //Form(
                          //key: EditPageKey,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: FirstNameController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please Enter your first name...";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  firstName = val;
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: "Enter your first name",
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text("Last name"),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: LastNameController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please Enter your last name...";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  lastName = val;
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: "Enter your last name",
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text("Phone number"),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                controller: PhoneNumberController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please Enter your Phone Number...";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  phoneNumber = val;
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: "Enter your Phone Number",
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text("Email"),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: EmailController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please Enter your Email...";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  email = val;
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: "Enter your Email",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
