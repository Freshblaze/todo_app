import 'package:flutter/material.dart';
import 'package:todo_app/utili/my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    required this.onCancel,
    required this.onSave,
    required this.controller,
    super.key,
  });
  final TextEditingController controller;
  final void Function() onSave;
  final Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(223, 140, 163, 246),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                label: const Text('Add new task'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // save button and cancel button

                //Save_button
                MyButton(
                  onPress: onSave,
                  text: 'Save',
                ),
                //Cancel_button
                MyButton(
                  onPress: onCancel,
                  text: 'Cancel',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
