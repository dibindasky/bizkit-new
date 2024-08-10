import 'package:excel/excel.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class ExcelViewerScreen extends StatefulWidget {
  final String filePath;

  ExcelViewerScreen({required this.filePath});

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
      print(table); //sheet Name
      print(excel.tables[table]?.maxCols);
      print(excel.tables[table]?.maxRows);
      data = excel.tables[table]?.rows ?? [];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Excel Viewer')),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, rowIndex) {
          return Row(
            children: data[rowIndex]
                .map((cell) => Expanded(child: Text(cell?.value.toString() ?? '')))
                .toList(),
          );
        },
      ),
    );
  }
}
