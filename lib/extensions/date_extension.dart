import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime{

  bool isToday(){
    DateTime now = DateTime.now();

    DateTime nowAtStartOfDay = DateTime(now.year, now.month, now.day);
    DateTime thisAtStartOfDay = DateTime(this.year, this.month, this.day);

    return thisAtStartOfDay.isAtSameMomentAs(nowAtStartOfDay);
  }

}