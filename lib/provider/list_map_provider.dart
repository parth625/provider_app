import 'package:flutter/widgets.dart';

class ListMapProvider extends ChangeNotifier{
  List<Map<String, dynamic>> mList = [];

  void addData(Map<String, dynamic> data){
    mList.add(data);
    notifyListeners();
  }

  void updateData(Map<String, dynamic> updatedData, int index){
    mList[index] = updatedData;
    notifyListeners();
  }

  void deleteData(int index){
    mList.removeAt(index);
    notifyListeners();
  }

  List<Map<String, dynamic>> getData(){
    return mList;
  }


}