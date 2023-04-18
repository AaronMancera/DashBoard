import 'package:niveles_formacion/data/model/dashboard_panel_item/dashboard_panel_item.dart';

class DashboardPanelItemLevel extends DashboardPanelItem {
  DashboardPanelItemLevel(
      {required super.width,
      required super.height,
      required super.identifier,
      required super.panelOptions,
      // Alto y ancho minimo opcional
      super.minWidth,
      super.minHeight});
}
