import 'package:dw_front/cubit/Scenario/cubit.dart';
import 'package:dw_front/cubit/navigation/cubit.dart';
import 'package:dw_front/ui/widgets/number_button.dart';
import 'package:dw_front/ui/widgets/script_line.dart';
import 'package:dw_front/ui/widgets/strider_divider.dart';
import 'package:dw_front/ui/widgets/strider_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';



class ScenarioReadyScreen extends StatefulWidget {
  @override
  _ScenarioReadyScreenState createState() => _ScenarioReadyScreenState();
}

class _ScenarioReadyScreenState extends State<ScenarioReadyScreen> {
  final List<Map<String, dynamic>> _data = [
    {
      'id': 1,
      'Начало': '00:00:23,160',
      'Конец': '00:00:24,660',
      'Персонаж': 'Гэндальф',
      'Оригинальный текст': 'Hear you now...',
      'Текст перевода': 'Ну а теперь - слушайте!'
    },
    {
      'id': 2,
      'Начало': '00:00:24,935',
      'Конец': '00:00:27,139',
      'Персонаж': 'Гэндальф',
      'Оригинальный текст': '...a story of good against evil.',
      'Текст перевода': 'Слушайте историю о борьбе добра и зла,'
    },
    {
      'id': 3,
      'Начало': '00:00:27,265',
      'Конец': '00:00:30,029',
      'Персонаж': 'Гэндальф',
      'Оригинальный текст': 'An epoch that has its beginning at an ending...',
      'Текст перевода': 'эпос, что начинается в конце...'
    },
    {
      'id': 4,
      'Начало': '00:00:30,367',
      'Конец': '00:00:32,534',
      'Персонаж': 'Гэндальф',
      'Оригинальный текст': '...and ends at a beginning.',
      'Текст перевода': '...и кончается в начале.'
    },
  ];

  final List<String> _columns = [
    'id',
    'Начало',
    'Конец',
    'Персонаж',
    'Оригинальный текст',
    'Текст перевода'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Сценарий'), actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
      ]),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: ScrollController(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: ScrollController(),
          child: Column(
            children: [
              const Divider(thickness: 1),
              DataTable(
                columnSpacing: 120,
                columns: _columns
                    .map((column) => DataColumn(label: Text(column)))
                    .toList(),
                rows: _data
                    .map(
                        (item) => DataRow(
                        onSelectChanged: (_) async {
                          // Обработчик клика на строку
                          final result = await showDialog(
                            context: context,
                            builder: (context) => const ScriptLine(),
                          );
                        },
                        cells: _columns
                            .map(
                                (column) => DataCell(
                              Text(
                                item[column].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                                    onTap: () {}
                            ))
                            .toList()))
                    .toList(),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
