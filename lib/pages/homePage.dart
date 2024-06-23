import 'package:flutter/material.dart';
import 'package:todoapp/components/todoTile.dart';
import 'package:todoapp/components/dialogBox.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  final _controller = TextEditingController();

  List toDoList = [
    ["finish flutter tutorial",false],
    ["specification document",false]
  ];
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();
    });
  }

  void createNewTask(){
    showDialog(context: context, builder: (context){
      return dialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop() ,

      );
    },
    );
  }
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          title: const Text('To Do',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          )
          ),
          centerTitle: true,
          backgroundColor: Colors.purple[200],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child:Icon(Icons.add),
          backgroundColor: Colors.purple[200],
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context,index){
            return ToDoTile(taskName: toDoList[index][0], taskCompleted: toDoList[index][1], onChanged: (value) => checkBoxChanged(value, index,),
              deleteFunction: (context) =>deleteTask(index),
            );
          },
      
      
        )
      
      ),
    );
  }
}