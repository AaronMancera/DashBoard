//Gauge
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../dashboard_item/dashboard_item_viewmodel.dart';


class LinearGauge extends StatelessWidget {
  final DashboardItemViewModel viewModel;
  const LinearGauge({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      minimum: viewModel.minimo.toDouble(),
      maximum: viewModel.maximo.toDouble(),
      orientation: viewModel.orientacion,
      markerPointers: [
        LinearShapePointer(
          value: viewModel.value,
          onChanged: (value) {
            viewModel.update(value);
          },
        )
      ],
      barPointers: [
        LinearBarPointer(
          value: viewModel.value,
          color: viewModel.color,
        )
      ],
    );
  }
}
