import 'package:flutter/material.dart';

class SelectedDateProvider with ChangeNotifier {
  DateTime _selectedDay = DateTime.now();
  final int _durasi = 0;

  DateTime get selectedDay => _selectedDay;
  int get durasi => _durasi;

  void setSelectedDay(DateTime newDay) {
    _selectedDay = newDay;
    fetchDataTrip(); // Don't await here to allow the UI to remain responsive
    notifyListeners();
  }

  Future<void> fetchDataTrip() async {
    /*try {
      var tripResponse = await getUserTrip();
      Map<String, dynamic> dailyDuration =
          tripResponse["data"]["daily_durations"];
      _durasi = dailyDuration[dateTimeConverter(_selectedDay)] ?? 0;
    } catch (e) {
      print('Fetch data error: $e');
      _durasi =
          0; // Handle error condition, set _durasi to 0 or any default value
    }*/
    notifyListeners();
  }
}
