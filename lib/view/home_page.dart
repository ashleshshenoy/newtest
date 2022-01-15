import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController taskcontroller = TextEditingController();

  var tasks = [ 
      "task1",
      "task2"
  ];

  void addTask(task) {
      tasks.add(task);
      setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text( 'My ECOM APE', style: GoogleFonts.cuteFont(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing:2,  ), ),
        centerTitle: true,
      ),
      drawer: Drawer(child: Column()),
      body: Stack(

          children: [
             ListView.builder(
               itemCount : tasks.length,
               itemBuilder: (context, index){

                 return Container(width:100, height:150, child: Text(tasks[index]),alignment: Alignment.center   ,color: Colors.purple.shade100,margin: EdgeInsets.all(10)  )
                 ;
               },
             ),
            
            Positioned(
              child: Container(
                color: Colors.grey.shade200,
                height: 100,
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height:50,
                      width:MediaQuery.of(context).size.width-140,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200,
                        width: 0.0,),
                        borderRadius: BorderRadius.circular(3)),
                      child: TextFormField(
                        autocorrect: true,
                        controller: taskcontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type anything",
                          contentPadding: EdgeInsets.all(12)
                        ),
                      ),
                      
                    ),
                  )
                  , 
                  InkWell(
                    onTap: (){
                        if (taskcontroller.text.isNotEmpty) {
                            addTask(taskcontroller.text);
                            taskcontroller.text = '';
                            AlertDialog(title: Text("hello world "), content: Text("empty task assigned "));
                        }
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                  
                  
                      ),  
                      child: Icon(Icons.add, color: Colors.grey, size: 40) ,
                    ),
                  )
                  ],
                )
                
              ),
              width: MediaQuery.of(context).size.width,
              height:80,

              bottom: 0,
            ),
            
          ]
      ),
    );
  }
}