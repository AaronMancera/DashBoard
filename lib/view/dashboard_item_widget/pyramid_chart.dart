import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../dashboard_item/dashboard_item_viewmodel.dart';

class PyramidChart extends StatelessWidget {
  final DashboardItemViewModel viewModel;

  const PyramidChart({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SfPyramidChart(
        // Enables the legend
        legend: Legend(isVisible: true),
        series: PyramidSeries<ChartData, String>(
          dataSource: viewModel.valoresChart,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          // Render the data label
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ));
  }
}