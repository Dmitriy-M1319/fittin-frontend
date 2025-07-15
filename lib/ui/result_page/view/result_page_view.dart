import 'package:fittin_frontend/assets.dart';
import 'package:fittin_frontend/ui/result_page/view_model/resut_page_view_model.dart';
import 'package:fittin_frontend/domain/models/result/result.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPageView extends ConsumerWidget {
  const ResultPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(resultPageProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightUiTheme.backgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Результаты теста',
          style: GoogleFonts.getFont(
            "Montserrat",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: vm.isResultCalculating
          ? _buildLoadingIndicator()
          : _buildResultContent(vm.calculatedResult),
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              LightUiTheme.backgroundColor,
            ),
            strokeWidth: 5,
          ),
          const SizedBox(height: 20),
          Text(
            'Рассчитываем результат',
            style: GoogleFonts.getFont(
              "Montserrat",
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultContent(TestResult result) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileChart(result),
          const SizedBox(height: 24),
          _buildScalesTable(result),
          const SizedBox(height: 24),
          _buildInterpretationSection(result),
        ],
      ),
    );
  }

  // Остальные методы (_buildProfileChart, _buildScalesTable и т.д.)
  // остаются без изменений, как в вашем исходном коде
  Widget _buildProfileChart(TestResult testResult) {
    return SizedBox(
      height: 400,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 100,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final scale = testResult.scales[groupIndex];
                return BarTooltipItem(
                  '${scale.scale}\n${scale.value}',
                  const TextStyle(color: Colors.white),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final scale = testResult.scales[value.toInt()];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: 80,
                      child: Text(
                        scale.scale,
                        style: GoogleFonts.getFont(
                          "Montserrat",
                          fontSize: 10,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                reservedSize: 40,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 10,
                getTitlesWidget: (value, meta) {
                  return Text(value.toInt().toString());
                },
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: FlGridData(
            show: true,
            checkToShowHorizontalLine: (value) => value % 10 == 0,
            getDrawingHorizontalLine: (value) =>
                FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 1),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey),
          ),
          barGroups: testResult.scales
              .asMap()
              .entries
              .map(
                (entry) => BarChartGroupData(
                  x: entry.key,
                  barRods: [
                    BarChartRodData(
                      toY: entry.value.value.toDouble(),
                      color: _getColorForValue(entry.value.value),
                      width: 16,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: 100,
                        color: Colors.grey[200],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildScalesTable(TestResult testResult) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Значения по шкалам',
              style: GoogleFonts.getFont(
                "Montserrat",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Table(
              border: TableBorder.all(color: Colors.grey),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Шкала',
                        style: GoogleFonts.getFont(
                          "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'T-балл',
                        style: GoogleFonts.getFont(
                          "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                ...testResult.scales
                    .map(
                      (scale) => TableRow(
                        decoration: BoxDecoration(
                          color: _getTableRowColor(scale.value),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(scale.scale),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              scale.value.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _getTextColorForValue(scale.value),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInterpretationSection(TestResult testResult) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Интерпретация профиля',
              style: GoogleFonts.getFont(
                "Montserrat",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              testResult.information,
              style: GoogleFonts.getFont(
                "Montserrat",
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Рекомендации:',
              style: GoogleFonts.getFont(
                "Montserrat",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '1. Высокие показатели (>70 T-баллов) требуют внимания специалиста\n'
              '2. Средние значения (50-60) - вариант нормы\n'
              '3. Низкие значения (<40) могут указывать на отрицание проблем',
              style: GoogleFonts.getFont(
                "Montserrat",
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTableRowColor(int value) {
    if (value >= 70) return Colors.red.withOpacity(0.2);
    if (value >= 60) return Colors.orange.withOpacity(0.2);
    if (value <= 40) return Colors.blue.withOpacity(0.2);
    return Colors.transparent;
  }

  Color _getTextColorForValue(int value) {
    if (value >= 70) return Colors.red;
    if (value >= 60) return Colors.orange;
    if (value <= 40) return Colors.blue;
    return Colors.black;
  }

  Color _getColorForValue(int value) {
    if (value >= 70) return Colors.red;
    if (value >= 60) return Colors.orange;
    if (value <= 40) return Colors.blue;
    return Colors.green;
  }
}
