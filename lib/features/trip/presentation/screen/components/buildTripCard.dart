import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/helpers/index.dart';
import '../../../../trip/domain/entities/trip.dart';

Widget buildTripScreenCard(Trip trip, BuildContext context) {
  final startDate = DateTime.parse(trip.start_date.toString());
  final hasEndDate = trip.end_date != null;
  final endDate = hasEndDate ? DateTime.parse(trip.end_date.toString()) : null;

  final startDateStr = DateFormat('dd MMM y').format(startDate);
  final endDateStr = hasEndDate ? DateFormat('dd MMM y').format(endDate!) : "N/A";

  final startTime = DateFormat('HH:mm').format(startDate);
  final endTime = hasEndDate ? DateFormat('HH:mm').format(endDate!) : "N/A";

  final startDateTimeStr = DateFormat('HH:mm dd MMM y').format(startDate);
  final endDateTimeStr = hasEndDate
      ? DateFormat('HH:mm dd MMM y').format(endDate!)
      : "N/A";

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(16), // rounded border
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Trip ID
        Text(
          "#${trip.uid}",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        // Main Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Start/End Date Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("START DATE",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 12)),
                Text(
                  startDateTimeStr,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text("END DATE",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 12)),
                Text(
                  endDateTimeStr,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),

            // Start/End Time Section

            // Shift Duration REST
            Column(
              children: [
                Text("REST",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 14)),
                Text(
                  formatMinutesToHHMM(trip.total_rest ?? 0),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("hour : min",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 14)),
              ],
            ),

            // Shift Duration WORK
            Column(
              children: [
                Text("WORK",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 14)),
                Text(
                  formatMinutesToHHMM(trip.total_work ?? 0),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("hour : min",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 14)),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
