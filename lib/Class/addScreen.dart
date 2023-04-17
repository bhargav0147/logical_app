import 'dart:html';

import 'package:flutter/material.dart';
import 'package:logical_app/Class/dashScreen.dart';
import 'package:logical_app/utils/dataClass.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController txtGrid = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtStd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "New Student", style: TextStyle(
            fontSize: 20,
            letterSpacing: 2,
            color: Colors.white
        ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              controller: txtGrid,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black26),

                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black54,width: 2)
              ),
                label: Text("Grid",style: TextStyle(color: Colors.black54),),
            ),),
            SizedBox(height: 10),
            TextField(
              controller: txtName,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black26),

                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black54,width: 2)
                ),
                label: Text("Name",style: TextStyle(color: Colors.black54),),
              ),),
            SizedBox(height: 10),
            TextField(
              controller: txtStd,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black26),

                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black54,width: 2)
                ),
                label: Text("Std",style: TextStyle(color: Colors.black54),),
              ),),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                String? name=txtName.text;
                int grid=int.parse(txtGrid.text);
                int std=int.parse(txtStd.text);

                Data d1 = Data(std: std,name: name,grid: grid);
                studentinfo.add(d1);
                Navigator.pop(context);
              },
              child: Container(
                height: 40,width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text(
                    "Submit",style: TextStyle(color: Colors.white,letterSpacing: 1,fontSize: 15),
                  ),
                ),
              ),
            )
          ],
          ),
        ),
      ),
    ));
  }
}
