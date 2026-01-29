import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/pages/update_data_page.dart';
import 'add_item_page.dart';
import '../provider/list_map_provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List')),
      body: Consumer<ListMapProvider>(
        builder: (_, provider, _) {
          var allData = provider.getData();

          return allData.isNotEmpty
              ? ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${allData[index]['name']}'),
                      subtitle: Text('${allData[index]['mobile']}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateDataPage(index: index),
                          ),
                        );
                      },
                    );
                  },
                )
              : Center(child: Text('No items added yet.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddItemPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
