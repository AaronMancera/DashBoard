//TODO: Crear un widget que detecte que opcion habian selecionado añadir y personalice la creacion
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../alert_dialog/alert_dialog_viewmodel.dart';

class CustomItemView extends StatelessWidget {
  const CustomItemView({super.key, required this.viewModel});
  final AlertDialogViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(viewModel.widgetSelecionado),
    );
  }
}
