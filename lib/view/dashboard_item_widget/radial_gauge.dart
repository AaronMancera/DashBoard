import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../dashboard_item/dashboard_item_viewmodel.dart';

class RadialGauge extends StatelessWidget {
  final DashboardItemViewModel viewModel;

  const RadialGauge({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
        GaugeRange(
            startValue: 0,
            endValue: 40,
            color: Colors.green,
            startWidth: 10,
            endWidth: 10),
        GaugeRange(
            startValue: 40,
            endValue: 80,
            color: Colors.orange,
            startWidth: 10,
            endWidth: 10),
        GaugeRange(
            startValue: 80,
            endValue: 100,
            color: Colors.red,
            startWidth: 10,
            endWidth: 10)
      ], pointers: <GaugePointer>[
        NeedlePointer(value: viewModel.sliderValue)
      ], annotations: <GaugeAnnotation>[
        GaugeAnnotation(
            widget: Text(viewModel.sliderValue.toStringAsFixed(2),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            angle: 90,
            positionFactor: 0.5)
      ])
    ]);
  }
}