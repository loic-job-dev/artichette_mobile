import 'package:artichette/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

final calendarStyle = CalendarStyle(
  outsideDaysVisible: false,

  todayDecoration: BoxDecoration(
    color: AppColors.primary.withValues(alpha: 0.2),
    shape: BoxShape.circle,
  ),

  selectedDecoration: BoxDecoration(
    color: AppColors.primary,
    shape: BoxShape.circle,
  ),

  rangeHighlightColor:
  AppColors.primary.withValues(alpha: 0.15),

  rangeStartDecoration: BoxDecoration(
    color: AppColors.primary,
    shape: BoxShape.circle,
  ),

  rangeEndDecoration: BoxDecoration(
    color: AppColors.primary,
    shape: BoxShape.circle,
  ),

  weekendTextStyle: TextStyle(
    color: AppColors.error,
  ),

  defaultTextStyle: TextStyle(
    color: AppColors.secondary,
  ),
);