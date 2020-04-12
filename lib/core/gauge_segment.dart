import 'package:charts_common/common.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GaugeSegment {
  final String segment;
  final int value;
  final Color color;

  GaugeSegment(this.segment, this.value, {this.color = charts.Color.white});
}
