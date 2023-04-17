abstract class DashboardPanelItemOptions {
  DashboardPanelItemOptions({required this.uid, String? alias, int? minWidth, int? minHeight}) {
    this.alias = alias ?? uid;
  }

  final String uid;
  late String alias;
  late int minWidth;
  late int minHeight;

}
