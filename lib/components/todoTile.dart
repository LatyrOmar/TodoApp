import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext) ? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left:25.0,right:25.0,top:25.0 ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade200,
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            )
          ],

        ),
        child: Container(
          child:Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children:[
               Checkbox(value:taskCompleted,
                 onChanged: onChanged,
                 activeColor: Colors.purple[100],
               ),
                Text(taskName,
                style: TextStyle(
                  fontSize: 24.0,
                  decoration: taskCompleted ? TextDecoration.lineThrough:TextDecoration.none
                ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.purple[200],
            borderRadius: BorderRadius.circular(12)
          ),
        ),
      ),
    );
  }
}