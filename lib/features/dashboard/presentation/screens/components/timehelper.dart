import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;

class RestWorkCountdown extends StatefulWidget {
  final String? restEndIso; // ISO string from dashboard API
  final bool isWorking;     // current_status from dashboard API

  const RestWorkCountdown({super.key, required this.restEndIso, required this.isWorking});

  @override
  State<RestWorkCountdown> createState() => _RestWorkCountdownState();
}

class _RestWorkCountdownState extends State<RestWorkCountdown> {
  late Timer _timer;
  Duration remaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateRemaining());
  }

  void _updateRemaining() {
    if (widget.restEndIso == null) {
      // No rest time, no counting
      setState(() => remaining = Duration.zero);
      return;
    }

    final restEnd = DateTime.tryParse(widget.restEndIso!)?.toUtc();
    if (restEnd == null) return;

    final now = tz.TZDateTime.now(tz.local).toUtc();

    if (widget.isWorking) {
      // User started working, show Ready to work
      setState(() => remaining = Duration.zero);
      return;
    }

    final diff = restEnd.difference(now);

    if (!diff.isNegative) {
      // Still resting, countdown positive time remaining
      setState(() => remaining = diff);
    } else {
      // Rest time passed, count up positively since rest ended
      setState(() => remaining = now.difference(restEnd));
    }
  }


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get countdownText {
    if (widget.restEndIso == null) return "Ready to work";

    if (widget.isWorking) return "Ready to work";

    final hours = remaining.inHours.toString().padLeft(2, '0');
    final minutes = (remaining.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (remaining.inSeconds % 60).toString().padLeft(2, '0');

    // If remaining is counting up (rest ended), prefix with "+" to indicate overtime
    if (remaining.isNegative == false && remaining > Duration.zero) {
      return "$hours:$minutes:$seconds";
    } else {
      return "$hours:$minutes:$seconds";
    }
  }


  @override
  Widget build(BuildContext context) {
    final isOverRestTime = widget.restEndIso != null &&
        !widget.isWorking &&
        remaining > Duration.zero &&
        DateTime.tryParse(widget.restEndIso!)!.toUtc().isBefore(tz.TZDateTime.now(tz.local).toUtc());
    return Text(
      countdownText,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color:isOverRestTime ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.primary,
      ),
    );
  }
}