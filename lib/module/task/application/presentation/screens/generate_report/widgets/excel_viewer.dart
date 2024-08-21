import 'package:bizkit/utils/constants/colors.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class ExcelViewerScreen extends StatefulWidget {
  final String filePath;

  const ExcelViewerScreen({super.key, required this.filePath});

  @override
  _ExcelViewerScreenState createState() => _ExcelViewerScreenState();
}

class _ExcelViewerScreenState extends State<ExcelViewerScreen> {
  List<List<Data?>> data = [];

  @override
  void initState() {
    super.initState();
    _loadExcel();
  }

  void _loadExcel() async {
    final file = File(widget.filePath);
    final bytes = file.readAsBytesSync();
    final excel = Excel.decodeBytes(bytes);
    for (var table in excel.tables.keys) {
      data = excel.tables[table]?.rows ?? [];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Report')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Table(
              border: TableBorder.all(color: Colors.grey),
              columnWidths: {
                for (int i = 0; i < (data.isNotEmpty ? data[0].length : 0); i++)
                  i: const FixedColumnWidth(120),
              },
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    color: kgreen,
                  ),
                  children: data.isNotEmpty
                      ? data[0].map((cell) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              cell?.value.toString() ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          );
                        }).toList()
                      : [],
                ),
                for (int i = 1; i < data.length; i++)
                  TableRow(
                    decoration: BoxDecoration(
                      color: i % 2 == 0 ? Colors.grey.shade100 : Colors.white,
                    ),
                    children: data[i].map((cell) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          cell?.value.toString() ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
