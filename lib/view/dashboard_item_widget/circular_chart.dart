import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/model/chart_data.dart';
import '../dashboard_item/dashboard_item_viewmodel.dart';

class CircularChart extends StatelessWidget {
  final DashboardItemViewModel viewModel;

  const CircularChart({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        // Enables the legend
        legend: Legend(isVisible: true),
        series: <CircularSeries>[
          // Render pie chart
          PieSeries<ChartData, String>(
              dataSource: viewModel.valoresChart,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              // Render the data label
              dataLabelSettings: const DataLabelSettings(isVisible: true))
        ]);
  }
}