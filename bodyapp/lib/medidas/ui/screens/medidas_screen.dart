import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:intl/intl.dart';

class MedidasScreen extends StatelessWidget {
  const MedidasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    return Scaffold(
      appBar: AppBar(
        title: Text('Medidas'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              height: height - 64,
              child: Image.asset(
                'assets/images/women-silhouette.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              bottom: 25,
              right: width * .1,
              child: Text(
                  'Última atualização em ${dateFormat.format(DateTime.now())}'),
            ),
            Positioned(
              right: 48,
              top: 48,
              child: Row(
                children: [
                  MeasureLabelWidget(
                    label: 'Altura',
                    value: '170',
                    measure: 'cm',
                  ),
                  SizedBox(width: 16),
                  MeasureLabelWidget(
                    label: 'Peso',
                    value: '70',
                    measure: 'kg',
                  ),
                ],
              ),
            ),
            NestedMeasureWidget(
              top: 178,
              left: 0,
              width: width * .5,
              label: 'Pescoço',
              value: '95',
              measure: '',
            ),
            NestedMeasureWidget(
              top: 250,
              left: 0,
              width: width * .7,
              label: 'Peito',
              value: '95',
              measure: '',
            ),
            NestedMeasureWidget(
              top: 300,
              left: 66,
              width: (width - 130) * .5,
              label: 'Biceps',
              value: '95',
              measure: '',
            ),
            NestedMeasureWidget(
              top: 360,
              left: 0,
              width: width * .7,
              label: 'Cintura',
              value: '95',
              measure: '',
            ),
            NestedMeasureWidget(
              top: 420,
              left: 20,
              width: (width - 40) * .5,
              label: 'Quadril',
              value: '95',
              measure: '',
            ),
            NestedMeasureWidget(
              top: 500,
              left: 10,
              width: (width - 20) * .7,
              label: 'Coxa',
              value: '95',
              measure: '',
            ),
            NestedMeasureWidget(
              top: 600,
              left: 10,
              width: (width - 120) * .7,
              label: 'Panturrilha',
              value: '95',
              measure: '',
            ),
            Positioned(
              right: 28,
              top: 280,
              child: Column(
                children: [
                  MeasureLabelWidget(
                    label: 'Gordura',
                    value: '170',
                    measure: '',
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: MeasureLabelWidget(
                      label: 'IMC',
                      value: '22',
                      measure: '',
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 28,
              top: 280,
              child: CustomPaint(
                size: Size(80, 80),
                painter: Arc(),
              ),
            ),
            Positioned(
              right: 28,
              top: 380,
              child: CustomPaint(
                size: Size(80, 80),
                painter: Arc(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class Arc extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, -20, 90, 80);
    final startAngle = -math.pi;
    final sweepAngle = math.pi;
    final useCenter = false;
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..shader = ui.Gradient.linear(
        Offset(0, 0),
        Offset(80, 80),
        [
          Colors.blue,
          Colors.green,
          Colors.red,
        ],
        [
          0.0,
          0.3,
          0.6,
        ],
      );
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class NestedMeasureWidget extends StatelessWidget {
  NestedMeasureWidget({
    Key? key,
    required this.width,
    this.top = 0,
    this.left = 0,
    required this.label,
    required this.value,
    this.measure = '',
  }) : super(key: key);

  final double width;
  final double top;
  final double left;
  final String label;
  final String value;
  final String measure;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 8),
                child: DottedLine(
                  dashGapLength: 8,
                ),
              ),
            ),
            MeasureLabelWidget(
              label: '$label',
              value: '$value',
              measure: '$measure',
            ),
          ],
        ),
      ),
    );
  }
}

class MeasureLabelWidget extends StatelessWidget {
  final String label;
  final String value;
  final String measure;

  const MeasureLabelWidget({
    Key? key,
    required this.label,
    required this.value,
    this.measure = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label'),
        RichText(
          text: TextSpan(
            text: '$value',
            style: TextStyle(
              fontSize: 36,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: ' $measure',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
