import 'package:flutter/foundation.dart';

///offering model toshow how much money collected at a particular month
class OfferingData {
  ///Month of the year
  final String month;
  ///Amount collected
  final double amount;

  OfferingData({
    @required this.month,
    @required this.amount,
  }); 
}