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
        ],
      ),
    );
  }
}
