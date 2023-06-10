import 'package:firebasematerial/controller/contact_controller.dart';
import 'package:firebasematerial/model/contact_model.dart';
import 'package:firebasematerial/view/contact.dart';
import 'package:flutter/material.dart';
import 'package:firebasematerial/view/homepage.dart';

class UpdateContact extends StatefulWidget {
  const UpdateContact({
    Key? key,
    this.username,
    this.id,
    this.name,
    this.phone,
    this.email,
    this.address,
  }) : super(key: key);

  final String? username;
  final String? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? address;

  @override
  State<UpdateContact> createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {
  var contactController = ContactController();
  final formkey = GlobalKey<FormState>();
  String? tempname;
  String? tempphone;
  String? tempmail;
  String? tempaddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Name'),
                onSaved: (value) {
                  tempname = value;
                },
                initialValue: widget.name,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Phone'),
                onSaved: (value) {
                  tempphone = value;
                },
                initialValue: widget.phone,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                onSaved: (value) {
                  tempmail = value;
                },
                initialValue: widget.email,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Address'),
                onSaved: (value) {
                  tempaddress = value;
                },
                initialValue: widget.address,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    ContactModel cm = ContactModel(
                      id: widget.id,
                      name: tempname!.toString(),
                      phone: tempphone!.toString(),
                      email: tempmail!.toString(),
                      address: tempaddress!.toString(),
                    );
                    contactController.updateContact(cm);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Contact Updated')),
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(username: widget.username),
                      ),
                    );
                  }
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
