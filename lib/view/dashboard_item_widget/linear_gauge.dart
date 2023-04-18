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
      markerPointers: [
        LinearShapePointer(
          value: viewModel.sliderValue,
          onChanged: (value) => viewModel.update(value),
        )
      ],
      barPointers: [
        LinearBarPointer(
          value: viewModel.sliderValue,
          color: viewModel.color,
        )
      ],
    );
  }
}
