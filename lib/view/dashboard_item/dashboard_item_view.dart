import 'dart:math';

import 'package:flutter/material.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item/dashboard_panel_item.dart';
import 'package:niveles_formacion/view/dashboard_item/dashboard_item_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DashboardItemView extends StackedView<DashboardItemViewModel> {
  const DashboardItemView(this.item, {super.key});

  final DashboardPanelItem item;

  @override
  Widget builder(
      BuildContext context, DashboardItemViewModel viewModel, Widget? child) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.color_lens),
          //cambia el color con un boton flotante
          onPressed: () => viewModel
              .changeColor(Random().nextInt(viewModel.colores.length - 1) + 1)),
      body: Center(
        child: Column(
          children: [
            //muestra identificador
            Text(item.identifier, style: TextStyle(color: viewModel.color)),
            const SizedBox(
              height: 10,
            ),
            if (item.identifier == 'Gauge1')
              _SfLinearGauge(
                viewModel: viewModel,
              ),
            if (item.identifier == 'Qr1')
              _SfBarcodeGenerator(
                viewModel: viewModel,
              ),
            if (item.identifier == 'CartesianChart1') const _SfCartesianChart(),
          ],
        ),
      ),
    );
  }

  @override
  DashboardItemViewModel viewModelBuilder(BuildContext context) =>
      DashboardItemViewModel();
}

class _SfCartesianChart extends StatelessWidget {
  const _SfCartesianChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        // Initialize category axis
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries>[
          // Initialize line series
          LineSeries<ChartData, String>(
              dataSource: [
                // Bind data source
                ChartData('Jan', 35),
                ChartData('Feb', 28),
                ChartData('Mar', 34),
                ChartData('Apr', 32),
                ChartData('May', 40)
              ],
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]);
  }
}

//QR
class _SfBarcodeGenerator extends StatelessWidget {
  final DashboardItemViewModel viewModel;
  const _SfBarcodeGenerator({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SfBarcodeGenerator(
        value: viewModel.url,
        showValue: true,
        textSpacing: 15,
        symbology: QRCode());
  }
}

//Gauge
class _SfLinearGauge extends StatelessWidget {
  final DashboardItemViewModel viewModel;
  const _SfLinearGauge({
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
