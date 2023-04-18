import 'package:flutter/material.dart';
import 'package:niveles_formacion/view/alert_dialog/alert_dialog_view_model.dart';
import 'package:niveles_formacion/view/dashboard/dashboard_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AlertDialogView extends StackedView<AlertDialogViewModel> {
  const AlertDialogView(this.dashboardViewModel, {super.key});
  final DashboardViewModel dashboardViewModel;

  @override
  Widget builder(
      BuildContext context, AlertDialogViewModel viewModel, Widget? child) {
    viewModel.restantes(dashboardViewModel.dashboardItemController.items);
    return AlertDialog(
      title: Text('Selector de widget'),
      content: DropdownButton<String>(
        value: viewModel.widgetSelecionado,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          viewModel.widgetSelected(value!);
        },
        items: viewModel.widgestDisponibles
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
      actions: [
        TextButton(
            child: Text("Aceptar"),
            onPressed: () {

              Navigator.of(context).pop(viewModel.widgetSelecionado);
              
            }),
        TextButton(
            child: Text("Cancelar"),
            onPressed: () {
              Navigator.of(context).pop("Ninguno");
            }),
      ],
    );
  }

  @override
  AlertDialogViewModel viewModelBuilder(BuildContext context) =>
      AlertDialogViewModel();
}
