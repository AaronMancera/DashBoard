import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AlertDialogViewModel extends BaseViewModel {
  //Todos los nombres/identificadores de widgets estan aqui
  String widgetSelecionado = "Ninguno";
  List<String> widgestDisponibles = [
    "Ninguno",
    "Qr",
    "Gauge",
    "Cartesian",
    "Circular",
    'Pyramid',
    'Funnel',
    'DateRangePicker',
    'RadialGauge'
  ];
  //Se actualiza el widget selecionado
  void widgetSelected(String value) {
    widgetSelecionado = value;
    notifyListeners();
  }

  //Muestra unicamente aquellos que aun no estan mostrandose en pantalla
  void restantes(List<String> valores) {
    widgestDisponibles.removeWhere((element) => valores.contains(element));
  }

  //TODO: Customizacion de wigets
  //Mapa con el nombre y los parametros de customizacion
  // Map <String,dynamic> widgetEntero = {
  //   "widget":"Qr",
  //   "url":"https://google.com"
  // };
  Map<String, dynamic> widgetEntero = {};
  void updateWidgetEntero(String clave, value) {
    widgetEntero[clave] = value;
  }

  //QR
  String urlQr = "";
  //Cartesian - Circular - FunnelChart - PyramidChart
  final List<ChartData> valoresChart = [];
  //Date-Range
  final Map<String, DateRangePickerView> rangosDias = {
    "Century": DateRangePickerView.century,
    "Decade": DateRangePickerView.decade,
    "Year": DateRangePickerView.year,
    "Month": DateRangePickerView.month,
  };
  bool enableMultiView = false;
  //LinearGauge - RadialGauge
  int minimo = 0;
  int maximo = 100;
  void updateMinimo(int value) {
    minimo = value;
    notifyListeners();
  }

  void updateMaximo(int value) {
    maximo = value;
    notifyListeners();
  }

  //LinearGauge
  LinearGaugeOrientation orientacionSelecionada =
      LinearGaugeOrientation.horizontal;
  String valorEscogido = "Horizontal";
  List<String> orientaciones = ["Horizontal", "Vertical"];
  void updateOrientacionSelecionada(value) {
    valorEscogido=value;
    value == orientaciones[0]
        ? orientacionSelecionada = LinearGaugeOrientation.horizontal
        : orientacionSelecionada = LinearGaugeOrientation.vertical;
        notifyListeners();
  }

  //RadialGauge

  //Actualizacion del qr
  void updateQr(String value) {
    urlQr = value;
    notifyListeners();
  }


  //Actualizacion de los valores para los chart - Cartesian
  String x="";
  int y=0;
  void updateX(value){
    x=value;
    notifyListeners();
  }
  void updateY(value){
    y=value;
    notifyListeners();
  }
  void updateValoresChart(ChartData chartData) {
    valoresChart.add(chartData);
    notifyListeners();
  }

  //Actualizar el multiview
  void updateEnableMultiView(bool opcion) {
    enableMultiView = opcion;
    notifyListeners();
  }
}

//Chart
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
