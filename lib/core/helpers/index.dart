import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat('yyyy-MM-dd');

void handleFieldErrors(BuildContext context, dynamic formKey, dynamic error) {
  final form = formKey.currentState;

  if (error is List) {
    for (final err in error) {
      if (err is Map<String, dynamic>) {
        final field = err['field']?.toString();
        final message = err['message']?.toString();

        if (field != null && message != null) {
          form?.fields[field]?.invalidate(message); // show inline error
        }
      }
    }
  } else if (error is String) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }
}

String prettifyLabel(String name) {
  return name
      .split('_')
      .map(
        (word) => word.isEmpty
            ? ''
            : word[0].toUpperCase() + word.substring(1).toLowerCase(),
      )
      .join(' ');
}

class LogFormArgs {
  final String trip_id;
  final String? uid;

  const LogFormArgs({required this.trip_id, this.uid});
}

String formatMinutesToHHMM(double minutes) {
  final int hours = minutes ~/ 60; // integer division
  final int mins = (minutes % 60).round();
  return '${hours.toString().padLeft(2, '0')}:${mins.toString().padLeft(2, '0')}';
}

String formatLogDate(String dateStr) {
  final date = DateTime.parse(dateStr); // parse ISO string
  final formatter = DateFormat('dd MMM');
  return formatter.format(date);
}

String formatLogTime(String dateStr) {
  final date = DateTime.parse(dateStr); // parse ISO string
  final formatter = DateFormat('HH:mm');
  return formatter.format(date);
}

String formatViolationDateTime(String dateStr) {
  final date = DateTime.parse(dateStr); // parse ISO string
  final formatter = DateFormat('dd MMM HH:mm');
  return formatter.format(date);
}
