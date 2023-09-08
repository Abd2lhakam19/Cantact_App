import 'package:contacts/addCard.dart';
import 'package:contacts/button.dart';
import 'package:flutter/material.dart';
class Contact {
  final String name;
  final String phone;
  Contact({required this.name,required this.phone});
}
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  List<Contact> contactList = [];
  bool isSelected = false;
  void addContact()
  {
    String name = nameController.text;
    String phone = phoneController.text;
    if(name.isNotEmpty && phone.isNotEmpty)
      {
        Contact newContact = Contact(name:name, phone:phone);
        setState(() {
          contactList.add(newContact);
          isSelected = true;
        });
        nameController.clear();
        phoneController.clear();
      }
  }
  void deleteContact()
  {
    if(contactList.isNotEmpty)
      {
        setState(() {
          contactList.removeLast();
          if(contactList.isEmpty)
            {
              isSelected = false;
            }
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Contacts",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(244, 243, 243, 1)),
              // margin: EdgeInsets.all(25),
              child: Center(
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      hintText: "Enter name here",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(244, 243, 243, 1)),
              // margin: EdgeInsets.all(25),
              child: Center(
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                      hintText: "Enter phone here",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(160, 50),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 12,
                      shadowColor: Colors.black),
                  onPressed: () {
                    addContact();
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(160, 50),
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 12,
                      shadowColor: Colors.black),
                  onPressed: () {
                    deleteContact();
                  },
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Visibility(
              visible: isSelected,
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: contactList.map((contact){
                      return Container(
                        margin: EdgeInsets.only(top: 14),
                        height: 129,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [BoxShadow(color: Colors.green, blurRadius: 10)]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                  AssetImage("assets/images/MyPhoto.jpg"),
                                  radius: 30,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  contact.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            // SizedBox(
                            //   width: 20,
                            // ),
                            Text(
                              contact.phone,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.black87),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.call,
                                  color: Colors.green,
                                  size: 30,
                                ))
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
