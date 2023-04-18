import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../dashboard_item/dashboard_item_viewmodel.dart';

class CartesianChart extends StatelessWidget {
  final DashboardItemViewModel viewModel;
  const CartesianChart({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        //leyenda en la grafica
        legend: Legend(isVisible: true),
        //borde de la grafica
        borderColor: viewModel.color,
        // Initialize category axis
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries>[
          // Initialize line series
          LineSeries<ChartData, String>(
            dataSource: viewModel.valoresChart,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            color: viewModel.color,
          )
        ]);
  }
}

