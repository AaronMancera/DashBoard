import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import '../dashboard_item/dashboard_item_viewmodel.dart';

class BarcodeGenerator extends StatelessWidget {
  final DashboardItemViewModel viewModel;
  const BarcodeGenerator({
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