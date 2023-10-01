// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import '../models/models_task.dart';
import '../widgets/counter.dart';
import '../widgets/text_field_add.dart';
import '../widgets/todo-card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // يتم اضافه كل المهام الجديده هنا
  List allTasks = [];
// الكود ده مسؤول لما اضغط علي اي مهمه ان هيا تم او لا ب علامه صح او خطا
  changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    });
  }

// وحدة تحكم تحرير النص
// TextField يتم استخدام هذا الكود لارسال وربط البيانات المستلمه من المستخدم في
  final myController = TextEditingController();
// حساب المهام المكتملة
  int calculateCompletedTasks() {
    int completedTasks = 0;
    for (var element in allTasks) {
      if (element.status) {
        completedTasks++;
      }
    }
    return completedTasks;
  }

// Widget Dialog إضافة مهمة جديدة موجود في
  addNewTask() {
    setState(() {
      allTasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }

//  يحذف عنصر
  delete(int deleteTask) {
    setState(() {
      allTasks.remove(allTasks[deleteTask]);
    });
  }

// AppBar يحذف جميع العناصر باستخدام ايقونه موجوده في
  deleteAll() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1),
        actions: [
          IconButton(
            onPressed: () {
              deleteAll();
            },
            icon: const Icon(
              Icons.delete_forever,
              size: 35,
              color: Color.fromARGB(255, 255, 200, 196),
            ),
          ),
        ],
        title: const Text(
          'TO DO APP',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Counter(
            allTodos: allTasks.length,
            allCompleted: calculateCompletedTasks(),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 55, 63, 82),
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: allTasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return TodoCard(
                    varTitle: allTasks[index].title,
                    doneORnot: allTasks[index].status,
                    changeStatus: changeStatus,
                    index: index,
                    delete: delete,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  padding: const EdgeInsets.all(22),
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFieldAdd(controller: myController),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            child: const Text('add'),
                            onPressed: () {
                              addNewTask();
                              Navigator.pop(context);
                            }),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
