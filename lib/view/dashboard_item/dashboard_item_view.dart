import 'dart:math';

import 'package:flutter/material.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item/dashboard_panel_item.dart';
import 'package:niveles_formacion/view/dashboard_item/dashboard_item_viewmodel.dart';
import 'package:stacked/stacked.dart';
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
              SfLinearGauge(
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
              ),
            if (item.identifier == 'Gauge2')
              SfLinearGauge(
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
