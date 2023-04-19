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
  List<LinearGaugeOrientation> orientacion = [
    LinearGaugeOrientation.horizontal,
    LinearGaugeOrientation.vertical
  ];
  List<LinearGaugeRange> rangosLinear = [];
  bool markerPointer = false;
  int valorPointer = 0;
  bool linearBarPointer = false;
  int valorBarPinter = 0;

  //RadialGauge

  //Actualizacion del qr
  void updateQr(String value) {
    urlQr = value;
    notifyListeners();
  }

  //Actualizacion de los valores para los chart
  void updateValoresChart(ChartData chartData) {
    valoresChart.add(chartData);
    notifyListeners();
  }

  //Actualizar el multiview
  void updateEnableMultiView(bool opcion) {
    enableMultiView = opcion;
    notifyListeners();
  }

  //NOTE: Actualizar configuracion para el LinearGauge
  //Añade rango personalizado con colores y todo - LinearGaugeRange(startValue: 0, endValue: 50, color: Colors.green),
  void updateLinearGaugeRange(LinearGaugeRange linearGaugeRange) {
    rangosLinear.add(linearGaugeRange);
    notifyListeners();
  }

  //Activar la opcion de que aparezca el pmarkerpointer
  void updateMarkerPointer(bool opcion) {
    markerPointer = opcion;
    notifyListeners();
  }

  //Asignaer el valor
  void updateValorPointer(valor) {
    valorPointer = valor;
    notifyListeners();
  }

  //Activar la opcion de que aparezca un bar coloreado
  void updateLinearBarPointer(bool opcion) {
    linearBarPointer = opcion;
    notifyListeners();
  }

  //Valor del bar
  void updatevalorBarPinter(valor) {
    valorBarPinter = valor;
  }
}

//Chart
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
