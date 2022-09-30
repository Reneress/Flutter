import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<ToDo> todoList = [];
  final TextEditingController todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO LIST'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2830F0),
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 8,
                      spreadRadius: 3,
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(-2, 3))
                ]),
            child: Row(
              children:  [
                Expanded(
                  child: TextField(
                    controller: todoController,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Color(0xFF2830F0),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        todoList.add(
                          ToDo(title: todoController.text, isDone: false),
                          ),
                      });
                    },
                    icon: Icon(Icons.add),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(itemCount: todoList.length,itemBuilder: (context, index){
            return Text( todoList[index].title);
             }),
          ),
        ],
      ),
    );
  }
}

class ToDo {
  final String title;
  bool isDone;

  ToDo({required this.title, required this.isDone});
}
