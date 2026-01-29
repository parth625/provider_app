import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../provider/list_map_provider.dart';

class AddItemPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Item')),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: mobileController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter mobile no",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty &&
                    mobileController.text.isEmpty) {
                  context.read<ListMapProvider>().addData({
                    "name": "Parth Rathod",
                    "mobile": "6767676767",
                  });
                } else {
                  context.read<ListMapProvider>().addData({
                    "name": nameController.text,
                    "mobile": mobileController.text,
                  });
                }

                nameController.clear();
                mobileController.clear();

                Navigator.pop(context);
              },
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }

  /// TODO: Update and Delete Item
}
