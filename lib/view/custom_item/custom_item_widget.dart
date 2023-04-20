//TODO: Crear un widget que detecte que opcion habian selecionado añadir y personalice la creacion
import 'package:flutter/material.dart';

import '../../data/model/chart_data.dart';
import '../alert_dialog/alert_dialog_viewmodel.dart';

class CustomItemWidget extends StatelessWidget {
  const CustomItemWidget({super.key, required this.viewModel});
  final AlertDialogViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text("Has selecionado ${viewModel.widgetSelecionado}"),
          if (viewModel.widgetSelecionado == "Qr")
            Column(
              children: [
                const Text("Escriba la Url"),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    viewModel.updateQr(value);
                    viewModel.updateWidgetEntero("Url", value);
                  },
                ),
              ],
            ),
          if (viewModel.widgetSelecionado == "Gauge")
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text("Escriba el minimo"),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    value == ""
                        ? viewModel.updateMinimo(0)
                        : viewModel.updateMinimo(int.parse(value));
                    viewModel.updateWidgetEntero("Minimo", viewModel.minimo);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Escriba el maximo"),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    value == ""
                        ? viewModel.updateMaximo(0)
                        : viewModel.updateMaximo(int.parse(value));
                    viewModel.updateWidgetEntero("Maximo", viewModel.maximo);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: List.generate(
                    viewModel.orientaciones.length,
                    (index) => RadioListTile(
                        title: Text(viewModel.orientaciones[index]),
                        value: viewModel.orientaciones[index],
                        groupValue: viewModel.valorEscogido,
                        onChanged: (value) {
                          viewModel.updateOrientacionSelecionada(value);
                          viewModel.updateWidgetEntero(
                              "Orientacion", viewModel.orientacionSelecionada);
                        }),
                  ),
                ),
              ],
            ),
          if (viewModel.widgetSelecionado == "Cartesian")
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text("Valor X:"),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    value == ""
                        ? viewModel.updateX("")
                        : viewModel.updateX(value);
                  },
                ),
                const Text("Valor Y:"),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    value == ""
                        ? viewModel.updateY(0)
                        : viewModel.updateY(int.parse(value));
                  },
                ),
                TextButton(
                    onPressed: () {
                      ChartData chartData =
                          ChartData(viewModel.x, viewModel.y.toDouble());
                      viewModel.x = "";
                      viewModel.y = 0;
                      viewModel.updateValoresChart(chartData);
                      viewModel.updateWidgetEntero(
                          "Valores", viewModel.valoresChart);
                    },
                    child: const Icon(Icons.plus_one)),
                //Mostrar los valores
                if (viewModel.widgetEntero.containsKey("Valores"))
                  Column(
                    children: [
                      const Text("Lista de valores:"),
                      Column(
                        children: List.generate(
                          viewModel.widgetEntero["Valores"].length,
                          (index) => Row(children: [
                            Text(
                                "X: ${viewModel.widgetEntero["Valores"][index].x}"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                                "Y: ${viewModel.widgetEntero["Valores"][index].y}"),
                          ]),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            if (viewModel.widgetSelecionado == "Circular")
            Column(
              children: const [
                Text("Circular")
              ],
            ),
            if (viewModel.widgetSelecionado == "Pyramid")
            Column(
              children: const [
                Text("Pyramid")
              ],
            ),
            if (viewModel.widgetSelecionado == "Funnel")
            Column(
              children: const [
                Text("Funnel")
              ],
            ),
            if (viewModel.widgetSelecionado == "DateRangePicker")
            Column(
              children: const [
                Text("DateRangePicker")
              ],
            ),
            if (viewModel.widgetSelecionado == "RadialGauge")
            Column(
              children: const [
                Text("RadialGauge")
              ],
            ),

          //TODO: Eliminar cuando se acaben las pruebas
          Text('${viewModel.widgetEntero}')
        ],
      ),
    );
  }
}
