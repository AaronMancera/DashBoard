import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../dashboard_item/dashboard_item_viewmodel.dart';

class DateRangePicker extends StatelessWidget {
  final DashboardItemViewModel viewModel;
  const DateRangePicker({
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
