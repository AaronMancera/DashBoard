//TODO: Crear un widget que detecte que opcion habian selecionado añadir y personalice la creacion
import 'package:flutter/material.dart';

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
                Text('${viewModel.widgetEntero}')
              ],
            ),
          if (viewModel.widgetSelecionado == "Gauge")
            Column(
              children: [
                const Text("Escriba el min"),
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
                const Text("Escriba el max"),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    value == ""
                        ? viewModel.updateMaximo(0)
                        : viewModel.updateMaximo(int.parse(value));
                    viewModel.updateWidgetEntero("Maximo", viewModel.maximo);
                  },
                ),
                Text('${viewModel.widgetEntero}')
              ],
            )
        ],
      ),
    );
  }
}
