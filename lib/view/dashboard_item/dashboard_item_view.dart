import 'dart:math';

import 'package:flutter/material.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item/dashboard_panel_item.dart';
import 'package:niveles_formacion/view/dashboard_item/dashboard_item_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
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
            if (item.identifier == 'CartesianChart1')
              _SfCartesianChart(
                viewModel: viewModel,
              ),
            if (item.identifier == 'CircularChart1')
              _SfCircularChart(
                viewModel: viewModel,
              ),
            if (item.identifier == 'PyramidChart1')
              _SfPyramidChart(
                viewModel: viewModel,
              ),
            if (item.identifier == 'FunnelChart1')
              _SfFunnelChart(
                viewModel: viewModel,
              ),
            if (item.identifier == 'DateRangePicker1')
              _SfDateRangePicker(
                viewModel: viewModel,
              ),
            if (item.identifier == 'RadialGauge1')
              Column(
                children: [
                  _SfLinearGauge(
                    viewModel: viewModel,
                  ),
                  _SfRadialGauge(
                    viewModel: viewModel,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  @override
  DashboardItemViewModel viewModelBuilder(BuildContext context) =>
      DashboardItemViewModel();
}

//RadialGauge
class _SfRadialGauge extends StatelessWidget {
  final DashboardItemViewModel viewModel;

  const _SfRadialGauge({
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

//SfDateRangePicker
class _SfDateRangePicker extends StatelessWidget {
  final DashboardItemViewModel viewModel;
  const _SfDateRangePicker({
    super.key,
    required this.viewModel,
  });

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    viewModel.updateDiaSeleccionado(
        '${args.value.day} - ${args.value.month} - ${args.value.year}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('El dia selecionado: ${viewModel.diaSeleccionado}'),
        SfDateRangePicker(
          onSelectionChanged: onSelectionChanged,
          view: DateRangePickerView.month,
          showTodayButton: true,
          enableMultiView: true,
        ),
      ],
    );
  }
}

//FunnelChart1
class _SfFunnelChart extends StatelessWidget {
  final DashboardItemViewModel viewModel;

  const _SfFunnelChart({
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

//PyramidChart
class _SfPyramidChart extends StatelessWidget {
  final DashboardItemViewModel viewModel;

  const _SfPyramidChart({
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

//CircularChart
class _SfCircularChart extends StatelessWidget {
  final DashboardItemViewModel viewModel;

  const _SfCircularChart({
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

//CartesianChart
class _SfCartesianChart extends StatelessWidget {
  final DashboardItemViewModel viewModel;
  const _SfCartesianChart({
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
