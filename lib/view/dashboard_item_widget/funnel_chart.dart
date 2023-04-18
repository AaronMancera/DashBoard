
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../dashboard_item/dashboard_item_viewmodel.dart';

class FunnelChart extends StatelessWidget {
  final DashboardItemViewModel viewModel;

  const FunnelChart({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SfFunnelChart(
        // Enables the legend
        legend: Legend(isVisible: true),
        series: FunnelSeries<ChartData, String>(
          dataSource: viewModel.valoresChart,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        ));
  }
}
