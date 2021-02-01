import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/offering_data.dart';

class OfferingGraph extends StatelessWidget {
  final String title;
  //OfferingGraph();
  OfferingGraph(this.title);
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      // Initialize category axis
      primaryXAxis: CategoryAxis(),
      // Chart title
      title: ChartTitle(text: title, textStyle: Theme.of(context).textTheme.headline5),
      tooltipBehavior: TooltipBehavior(enable: true),
      // Enable legend
      //legend: Legend(isVisible: true),
      series: <LineSeries<OfferingData, String>>[
        LineSeries<OfferingData, String>(
          // Bind data source
          dataSource: <OfferingData>[
            OfferingData('Jan', 35000),
            OfferingData('Feb', 28000),
            OfferingData('Mar', 34000.34),
            OfferingData('Apr', 32000),
            OfferingData('May', 40000),
            OfferingData('Jun', 40000)
          ],
          xValueMapper: (OfferingData offering, _) => offering.month,
          yValueMapper: (OfferingData offering, _) => offering.amount,
          dataLabelSettings: DataLabelSettings(isVisible: true) 
        )
      ],
    );
  }
}
