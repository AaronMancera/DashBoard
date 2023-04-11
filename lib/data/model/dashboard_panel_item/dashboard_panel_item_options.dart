abstract class DashboardPanelItemOptions {
  DashboardPanelItemOptions({required this.uid, String? alias}) {
    this.alias = alias ?? uid;
  }

  final String uid;
  late String alias;

}
