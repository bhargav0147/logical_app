import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logical_app/utils/dataClass.dart';

List<Data> studentinfo=[
  Data(name:"Aryan",grid: 3101,std: 9),
  Data(name:"Aksh",grid: 3102,std: 10),
  Data(name:"Shankar",grid: 3103,std: 11),
  Data(name:"Dev",grid: 3104,std: 12),
];

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  TextEditingController txtNewGrid = TextEditingController();
  TextEditingController txtNewName = TextEditingController();
  TextEditingController txtNewStd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Student List", style: TextStyle(
            fontSize: 20,
            letterSpacing: 2,
            color: Colors.white
        ),
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, 'add').then((value) {
          setState(() {

          });
        },);
      },child: Icon(Icons.add,size: 20,color: Colors.white,)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 800,width: double.infinity,
                child: ListView.builder(itemBuilder: (context, index) => showData(index),itemCount: studentinfo.length,),
              )
            ],
          ),
        )
      ),
    ));
  }

  Widget showData(int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 50,width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              height: 45,width: 60,
              child: Center(
                child: Text("${studentinfo[index].grid}",style: TextStyle(color: Colors.black,fontSize: 20),),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 45,width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("${studentinfo[index].name}",style: TextStyle(
                      color: Colors.black,letterSpacing: 1,fontSize: 20,
                    ),),
                  ),
                  SizedBox(height: 3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("${studentinfo[index].std}",style: TextStyle(
                      color: Colors.black,letterSpacing: 1,fontSize: 15,
                    ),),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 45,width: 45,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    txtNewName =TextEditingController(text: "${studentinfo[index].name}");
                    txtNewGrid =TextEditingController(text: "${studentinfo[index].grid}");
                    txtNewStd =TextEditingController(text: "${studentinfo[index].std}");
                    showDialog(barrierDismissible: false,context: context, builder: (context) {

                      return AlertDialog(

                        title: Text("Student Rename"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 10),
                            TextField(
                              controller: txtNewGrid,
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
                              controller: txtNewName,
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
                              controller: txtNewStd,
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
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    String? newname=txtNewName.text;
                                    int newgrid=int.parse(txtNewGrid.text);
                                    int newstd=int.parse(txtNewStd.text);

                                    Data d1 = Data(std: newstd,name: newname,grid: newgrid);
                                    setState(() {
                                      studentinfo[index]=d1;
                                    });
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
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
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
                                        "Cancel",style: TextStyle(color: Colors.white,letterSpacing: 1,fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },);
                  },icon: Icon(Icons.edit,size: 25,color: Colors.black,),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 45,width: 45,
              child: Center(
                child: IconButton(onPressed: () {
                    studentinfo.removeAt(index);
                    setState(() {

                    });
                },icon: Icon(Icons.delete,size: 25,color: Colors.red,)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
