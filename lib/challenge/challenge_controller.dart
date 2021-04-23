import 'package:flutter/material.dart';

class ChallengeController{
  final currentPageNovifier = ValueNotifier<int>(1);
  int get currentPage => currentPageNovifier.value;
  set currentPage(int value) => currentPageNovifier.value = value;  
}