import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  List<Color> gradientColors1 = [
    AppColors.contentColorBlue,
    AppColors.contentColorBlue,
  ];
  List<Color> gradientColors2 = [
    AppColors.contentColorCyan,
    AppColors.contentColorCyan,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Text("Dashboard", style: GoogleFonts.inter(
            textStyle:  TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight:
                FontWeight.bold)),
            ),
            Container(
              child: Card(
                elevation: 3,
                child: Stack(
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                            child: Center(
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: CircularPercentIndicator(
                                      radius: 70.0,
                                      lineWidth: 17.0,
                                      animation: true,
                                      percent: 0.198,
                                      circularStrokeCap: CircularStrokeCap.round,
                                      progressColor: const Color(0xFF7E64F1),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                  Positioned(
                                    child: CircularPercentIndicator(
                                      radius: 70.0,
                                      lineWidth: 17.0,
                                      animation: true,
                                      percent: 0.58,
                                      circularStrokeCap: CircularStrokeCap.round,
                                      progressColor: const Color(0xFF7E64F1),
                                      backgroundColor: Colors.transparent,
                                      startAngle: 90, // Adjust the startAngle to 0
                                    ),
                                  ),
                                  Positioned(
                                    child: CircularPercentIndicator(
                                      radius: 70.0,
                                      lineWidth: 17.0,
                                      animation: true,
                                      percent: 0.05,
                                      circularStrokeCap: CircularStrokeCap.round,
                                      progressColor: const Color(0xFF7E64F1),
                                      backgroundColor: Colors.transparent,
                                      startAngle: 320, // Adjust the startAngle to 0
                                    ),
                                  ),

                                  Positioned(
                                    top: 20,
                                    left: 20,
                                    child: CircularPercentIndicator(
                                      radius: 50.0,
                                      lineWidth: 15.0,
                                      animation: true,
                                      percent: 0.366, // 36.6% for demonstration
                                      backgroundColor: Colors.transparent,
                                      circularStrokeCap: CircularStrokeCap.round,
                                      progressColor: const Color(0xFF39EBFF),
                                      startAngle: 60,
                                    ),
                                  ),
                                  Positioned(
                                    top: 40,
                                    left: 40,
                                    child: CircularPercentIndicator(
                                      radius: 30.0,
                                      lineWidth: 13.0,
                                      animation: true,
                                      percent: 0.0909,
                                      backgroundColor: Colors.transparent,
                                      circularStrokeCap: CircularStrokeCap.round,
                                      progressColor: const Color(0xFFF8C646),
                                      startAngle: 100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(width: 20,),
                        Container(
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF7E64F1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Container(
                                    width: 64,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF39EBFF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(height: 6,),
                                  Container(
                                    width: 18,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF8C646),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("55"),
                                  Text("36%"),
                                  Text("9%"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 10,
                      left: 120,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: const Color(0xFF7E64F1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text("Contacts",style: GoogleFonts.inter(
                              textStyle:  const TextStyle(
                                  fontSize: 13,)),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: const Color(0xFF39EBFF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text("Leads",style: GoogleFonts.inter(
                              textStyle:  const TextStyle(
                                fontSize: 13,)),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8C646),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text("Deals",style: GoogleFonts.inter(
                              textStyle:  const TextStyle(
                                fontSize: 13,)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ),

            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 110,
                    child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Monthly Revenue",
                                    style: GoogleFonts.inter(
                                      textStyle:  const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                      )
                                    ),
                                  ),
                                  const Expanded(
                                      child: Icon(
                                        Icons.arrow_drop_up,
                                        size: 50,color: Color(0xFF4ECB71),
                                      )
                                  )
                                ],
                              ),
                              const Text("\₹24,000",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Color(0xFF4ECB71),
                                      fontWeight: FontWeight.bold
                                  )
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 110,
                    child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Annual Revenue",
                                    style: GoogleFonts.inter(
                                      textStyle:  const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold
                                      )
                                    ),
                                  ),
                                  const Expanded(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 50,
                                        color: Color(0xFFCB4E4E),
                                      )
                                  )
                                ],
                              ),
                              const Text(
                                  "\₹324,000",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Color(0xFFCB4E4E),
                                      fontWeight: FontWeight.bold
                                  )
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                ),
              ]
            ),
            const SizedBox(height: 20),
            Container(
              child:  Card(
                elevation: 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "\₹6000",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Color(0xFF4ECB71),
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    Text(
                                        "Overall Revenue",
                                        style: GoogleFonts.inter(
                                          textStyle:  const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,)),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF7E64F1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "Archived",
                                      style: GoogleFonts.inter(
                                        textStyle:  const TextStyle(
                                          fontSize: 12,
                                        )
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFC395FF),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "Target",
                                      style: GoogleFonts.inter(
                                          textStyle:  const TextStyle(
                                            fontSize: 12,
                                          )
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      "This Week",
                                      style: GoogleFonts.inter(
                                          textStyle:  const TextStyle(
                                            fontSize: 12,
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        child: Stack(
                          children: <Widget>[
                            // Original chart
                            Positioned.fill(
                              top: 30,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                child: Container(
                                  child: LineChart(
                                    showAvg ? avgData() : mainData(),
                                  ),
                                ),
                              ),
                            ),
                            // Duplicated chart
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                child: Container(
                                  child: LineChart(
                                    showAvg ? avgData2() : mainData2(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),



                    ],
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
        show: false,
        drawVerticalLine: false,
      ),
      titlesData: const FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2.6),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8.5, 5),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors1,
          ),
          barWidth: 0,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors1
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
  LineChartData mainData2() {
    return LineChartData(
      gridData: const FlGridData(
        show: false,
        drawVerticalLine: false,
      ),
      titlesData: const FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors2,
          ),
          barWidth: 0,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors2
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors1[0], end: gradientColors1[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors1[0], end: gradientColors1[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors1[0], end: gradientColors1[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors1[0], end: gradientColors1[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
  LineChartData avgData2() {
    return LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors2[0], end: gradientColors2[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors2[0], end: gradientColors2[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors2[0], end: gradientColors2[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors2[0], end: gradientColors2[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AppColors {
  static const Color contentColorCyan = Color(0xFF00FFFF);
  static const Color contentColorBlue = Color(0xFF0000FF);
}
