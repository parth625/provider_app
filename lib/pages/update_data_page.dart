import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/list_map_provider.dart';

class UpdateDataPage extends StatefulWidget {
  final int index;

  const UpdateDataPage({super.key, required this.index});

  @override
  State<UpdateDataPage> createState() => _UpdateDataPageState();
}

class _UpdateDataPageState extends State<UpdateDataPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text =
        context.read<ListMapProvider>().getData()[widget.index]['name'] ?? '';
    mobileController.text =
        context.read<ListMapProvider>().getData()[widget.index]['mobile'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Item')),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // initialValue: context.read<ListMapProvider>().getData()[index]['name'],
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: mobileController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter mobile no",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isEmpty &&
                        mobileController.text.isEmpty) {
                      context.read<ListMapProvider>().updateData({
                        "name": "Parth Rathod",
                        "mobile": "6767676767",
                      }, widget.index);
                    } else {
                      context.read<ListMapProvider>().updateData({
                        "name": nameController.text,
                        "mobile": mobileController.text,
                      }, widget.index);
                    }

                    nameController.clear();
                    mobileController.clear();

                    Navigator.pop(context);
                  },
                  child: Text('Update Item'),
                ),

                ElevatedButton(
                  onPressed: () {
                    context.read<ListMapProvider>().deleteData(widget.index);

                    nameController.clear();
                    mobileController.clear();

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
