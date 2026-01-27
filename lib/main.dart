import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:async';
import 'models/clp.dart';

void main() {
  runApp(const AndonApp());
}

/// Aplicação principal
class AndonApp extends StatelessWidget {
  const AndonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AndonScreen(),
    );
  }
}

/// Tela principal do ANDON
class AndonScreen extends StatefulWidget {
  const AndonScreen({Key? key}) : super(key: key);

  @override
  State<AndonScreen> createState() => _AndonScreenState();
}

class _AndonScreenState extends State<AndonScreen> {
  Timer? _timer;
  String _currentTime = '';
  String _currentDate = '';

  @override
  void initState() {
    super.initState();

    // Atualiza data/hora
    _updateDateTime();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      _updateDateTime();
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Atualiza hora e data do cabeçalho
  void _updateDateTime() {
    final now = DateTime.now();
    _currentTime =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
    _currentDate =
        '${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}';
  }

  /// Limita o valor exibido nos triângulos a no máximo 999
  String limitar3Digitos(int valor) {
    if (valor > 999) return '999';
    return valor.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 1920,
          height: 1080,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/andon_background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              // DATA
              Positioned(
                top: 20,
                right: 450,
                child: Text(
                  _currentDate,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),

              // HORA
              Positioned(
                top: 20,
                right: 340,
                child: Text(
                  _currentTime,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),

              // TURNO
              Positioned(
                top: 15,
                left: 220,
                right: 0,
                child: Center(
                  child: Text(
                    '${CLP.turno}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // HORA DO TURNO
              Positioned(
                top: 90,
                left: 0,
                right: 180,
                child: Center(
                  child: Text(
                    '${CLP.horaTurno}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // TRIÂNGULOS - ESQUERDA
              _triangle(400, 320, limitar3Digitos(CLP.triangleTopLeft)),
              _triangle(400, 460, limitar3Digitos(CLP.triangleBottomLeft)),

              // TRIÂNGULOS - CENTRO
              _triangle(815, 550, limitar3Digitos(CLP.triangleTopCenter)),
              _triangle(1030, 460, limitar3Digitos(CLP.triangleBottomCenter)),

              // TRIÂNGULOS - DIREITA
              _triangle(1420, 320, limitar3Digitos(CLP.triangleTopRight)),
              _triangle(1420, 460, limitar3Digitos(CLP.triangleBottomRight)),

              // GRÁFICO ESQUERDA
              Positioned(
                bottom: 8,
                left: 20,
                width: 560,
                height: 360,
                child: _buildChart(CLP.leftPartData, CLP.chart1Labels),
              ),

              // GRÁFICO CENTRO
              Positioned(
                bottom: 8,
                left: 680,
                width: 560,
                height: 360,
                child: _buildChart(CLP.centerPartData, CLP.chart2Labels),
              ),

              // GRÁFICO DIREITA
              Positioned(
                bottom: 8,
                right: 20,
                width: 560,
                height: 360,
                child: _buildChart(CLP.rightPartData, CLP.chart3Labels),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget padrão dos triângulos
  Widget _triangle(double left, double top, String value) {
    return Positioned(
      left: left,
      top: top,
      width: 80,
      height: 60,
      child: Center(
        child: Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// Gráfico de barras padrão do ANDON
  Widget _buildChart(List<double> data, List<String> labels) {
    // Limite máximo do eixo Y em 50
    const double maxYAxis = 50;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxYAxis,
        minY: 0,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 42,
              getTitlesWidget: (value, meta) {
                int index = value.toInt();
                if (index >= 0 && index < labels.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      labels[index],
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 45,
              interval: 5,
              getTitlesWidget: (value, meta) => Text(
                value.toInt().toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          rightTitles:
              AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:
              AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
          show: true,
          horizontalInterval: 5,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.blue.withOpacity(0.18),
            strokeWidth: 0.6,
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(8, (index) {
          final isHoraAtual = (index + 1) == CLP.horaTurno;

          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: data[index] > maxYAxis ? maxYAxis : data[index],
                color: isHoraAtual ? Colors.green : Colors.blue,
                width: 38,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
