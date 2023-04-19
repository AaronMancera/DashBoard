import 'dart:math';

import 'package:flutter/material.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item/dashboard_panel_item.dart';
import 'package:niveles_formacion/view/dashboard/dashboard_viewmodel.dart';
import 'package:niveles_formacion/view/dashboard_item/dashboard_item_viewmodel.dart';
import 'package:niveles_formacion/view/dashboard_item_widget/circular_chart.dart';
import 'package:niveles_formacion/view/dashboard_item_widget/date_range_picker.dart';
import 'package:niveles_formacion/view/dashboard_item_widget/funnel_chart.dart';
import 'package:niveles_formacion/view/dashboard_item_widget/pyramid_chart.dart';
import 'package:niveles_formacion/view/dashboard_item_widget/radial_gauge.dart';
import 'package:stacked/stacked.dart';

import '../dashboard_item_widget/barcode_generator.dart';
import '../dashboard_item_widget/cartesian_chart.dart';
import '../dashboard_item_widget/linear_gauge.dart';

class DashboardItemView extends StackedView<DashboardItemViewModel> {
  const DashboardItemView(this.item, this.viewModelPrincipal, {super.key});

  final DashboardPanelItem item;
  final DashboardViewModel viewModelPrincipal;

  @override
  Widget builder(
      BuildContext context, DashboardItemViewModel viewModel, Widget? child) {
    //Si esta creada desde el inciio simplmente no existe
    switch (viewModelPrincipal.widget["Widget"]) {
      case "Qr":
        viewModelPrincipal.widget['Url'] != null
            ? viewModel.url = viewModelPrincipal.widget['Url']
            : "";
        break;
      case "Gauge":
        viewModelPrincipal.widget['Minimo'] != null
            ? viewModel.minimo = viewModelPrincipal.widget['Minimo']
            : "";
        viewModelPrincipal.widget['Maximo'] != null
            ? viewModel.maximo = viewModelPrincipal.widget['Maximo']
            : "";
        break;
    }
    Map<String, Widget> widgets = {
      'Qr': BarcodeGenerator(
        viewModel: viewModel,
      ),
      'Gauge': LinearGauge(viewModel: viewModel),
      'Cartesian': CartesianChart(
        viewModel: viewModel,
      ),
      'Circular': CircularChart(
        viewModel: viewModel,
      ),
      'Pyramid': PyramidChart(
        viewModel: viewModel,
      ),
      'Funnel': FunnelChart(
        viewModel: viewModel,
      ),
      'DateRangePicker': DateRangePicker(
        viewModel: viewModel,
      ),
      'RadialGauge': RadialGauge(
        viewModel: viewModel,
      )
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: viewModel.color,
        title:
            Text(item.identifier, style: const TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Aquí va la lógica para eliminar
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text(
                            "¿Quieres eliminar el widget ${item.identifier}?"),
                        actions: [
                          TextButton(
                              child: const Text("Aceptar"),
                              onPressed: () {
                                Navigator.of(context).pop();
                                viewModelPrincipal.eliminarWidget(item);
                              }),
                          TextButton(
                              child: const Text("Cancelar"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ],
                      ));
            },
          ),
          IconButton(
              onPressed: () => viewModel.changeColor(
                  Random().nextInt(viewModel.colores.length - 1) + 1),
              icon: const Icon(Icons.color_lens))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            //Muestra el contenido dependiendo del identificador
            if (item.identifier == 'Qr')
              Container(
                child: widgets[item.identifier],
              ),
            if (item.identifier == 'Gauge')
              Container(
                child: widgets[item.identifier],
              ),

            if (item.identifier == 'Cartesian')
              Container(
                child: widgets[item.identifier],
              ),
            if (item.identifier == 'Circular')
              Container(
                child: widgets[item.identifier],
              ),
            if (item.identifier == 'Pyramid')
              Container(
                child: widgets[item.identifier],
              ),
            if (item.identifier == 'Funnel')
              Container(
                child: widgets[item.identifier],
              ),
            if (item.identifier == 'DateRangePicker')
              Container(
                child: widgets[item.identifier],
              ),
            if (item.identifier == 'RadialGauge')
              Column(
                children: [
                  Container(
                    child: widgets["Gauge"],
                  ),
                  Container(
                    child: widgets[item.identifier],
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
