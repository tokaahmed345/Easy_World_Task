import 'dart:io';
import 'package:character_hub/feature/home/data_source/model/character_model.dart';
import 'package:character_hub/feature/home/domain/entity/character_entity.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

class ExcelExportService {
  static Future<String?> exportCharactersToExcel(
    List<dynamic> characters,
  ) async {
    try {
      if (characters.isEmpty) return null;

      var excel = Excel.createExcel();

      String sheetName = excel.sheets.keys.first;
      Sheet sheetObject = excel[sheetName];

      sheetObject.isRTL = true;

      CellStyle headerStyle = CellStyle(
        bold: true,
        horizontalAlign: HorizontalAlign.Right,
        verticalAlign: VerticalAlign.Center,
      );

      CellStyle rightAlignStyle = CellStyle(
        horizontalAlign: HorizontalAlign.Right,
        verticalAlign: VerticalAlign.Center,
      );

      List<String> headers = [
        'ID',
        'Name',
        'Status',
        'Species',
        'Gender',
        'Type',
        'Origin',
        'Location',
      ];

      for (int col = 0; col < headers.length; col++) {
        var cell = sheetObject.cell(
          CellIndex.indexByColumnRow(columnIndex: col, rowIndex: 0),
        );
        cell.value = TextCellValue(headers[col]);
        cell.cellStyle = headerStyle;
      }

      for (int row = 0; row < characters.length; row++) {
        var item = characters[row];
        int rowIndex = row + 1;

        int id = _getId(item, row + 1);
        String name = _getVal(item, 'name');
        String status = _getVal(item, 'status');
        String species = _getVal(item, 'species');
        String gender = _getVal(item, 'gender');
        String type = _getVal(item, 'type');
        String originName = _getVal(item, 'originName');
        String locationName = _getVal(item, 'locationName');

        List<CellValue> rowValues = [
          IntCellValue(id),
          TextCellValue(name),
          TextCellValue(status),
          TextCellValue(species),
          TextCellValue(gender),
          TextCellValue(type),
          TextCellValue(originName),
          TextCellValue(locationName),
        ];

        for (int col = 0; col < rowValues.length; col++) {
          var cell = sheetObject.cell(
            CellIndex.indexByColumnRow(columnIndex: col, rowIndex: rowIndex),
          );
          cell.value = rowValues[col];
          cell.cellStyle = rightAlignStyle;
        }
      }

      Directory? directory;
      if (Platform.isAndroid) {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      } else {
        directory = await getApplicationDocumentsDirectory();
      }

      if (directory != null) {
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final filePath =
            '${directory.path}/Rick_and_Morty_Characters_$timestamp.xlsx';

        final fileBytes = excel.save();

        if (fileBytes != null) {
          final file = File(filePath);
          await file.writeAsBytes(fileBytes, flush: true);
          return filePath;
        }
      }
      return null;
    } catch (e) {
      print('Excel Export Error: $e');
      return null;
    }
  }

  static int _getId(dynamic item, int fallbackId) {
    if (item is CharacterModel) return item.id;
    try {
      final val = (item as dynamic).id;
      if (val is int) return val;
      if (val != null) return int.tryParse(val.toString()) ?? fallbackId;
    } catch (_) {}
    return fallbackId;
  }

  static String _getVal(dynamic item, String key) {
    if (item == null) return 'N/A';

    try {
      if (item is CharacterModel) {
        switch (key) {
          case 'name':
            return item.name.isNotEmpty ? item.name : 'N/A';
          case 'status':
            return item.status.isNotEmpty ? item.status : 'N/A';
          case 'species':
            return item.species.isNotEmpty ? item.species : 'N/A';
          case 'gender':
            return item.gender.isNotEmpty ? item.gender : 'N/A';
          case 'type':
            return item.type.isNotEmpty ? item.type : 'N/A';
          case 'originName':
            return item.originName.isNotEmpty ? item.originName : 'N/A';
          case 'locationName':
            return item.locationName.isNotEmpty ? item.locationName : 'N/A';
        }
      }

      if (item is CharacterEntity) {
        switch (key) {
          case 'name':
            return item.name.isNotEmpty ? item.name : 'N/A';
          case 'status':
            return item.status.isNotEmpty ? item.status : 'N/A';
          case 'species':
            return item.species.isNotEmpty ? item.species : 'N/A';
          default:
            return 'N/A';
        }
      }
    } catch (_) {}

    return 'N/A';
  }
}
