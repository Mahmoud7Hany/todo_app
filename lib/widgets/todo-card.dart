// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.varTitle,
    required this.doneORnot,
    required this.changeStatus,
    required this.index,
    required this.delete,
  });

  final String varTitle;
  final bool doneORnot;
  final Function changeStatus;
  final int index;
  final Function delete;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(209, 224, 224, 0.2),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                varTitle,
                style: TextStyle(
                    color: doneORnot ? Colors.black54 : Colors.white,
                    fontSize: 22,
                    decoration: doneORnot
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              Row(
                children: [
                  doneORnot
                      ? const Icon(
                          Icons.check,
                          size: 27,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.close,
                          size: 27,
                          color: Colors.red,
                        ),
                  const SizedBox(width: 17),
                  IconButton(
                      onPressed: () {
                        delete(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 255, 200, 196),
                        size: 27,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
