import 'package:dashboard/dashboard.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item/dashboard_panel_item_options.dart';

/// A [DashboardItem] is a widget that can be added to a [DashboardView].
/// It has a [width] and a [height] that defines how many cells it will occupy.
/// It also has an [identifier] that is used to identify the item.
/// If the panel view has many configurations, it can be useful to have a List<PanelOptions>
abstract class DashboardPanelItem extends DashboardItem {
  DashboardPanelItem(
      {required super.width, required super.height, required super.identifier, required this.panelOptions,});

  DashboardPanelItemOptions panelOptions;
}
