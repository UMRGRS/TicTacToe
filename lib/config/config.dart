library config.globals;

import 'package:flutter/material.dart';
export 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
export 'package:flutter/cupertino.dart' hide RefreshCallback;

import 'package:tic_tac_toe/screens/screens.dart';
export 'package:tic_tac_toe/screens/screens.dart';

import 'package:tic_tac_toe/widgets/widgets.dart';
export 'package:tic_tac_toe/widgets/widgets.dart';

import 'package:tic_tac_toe/utils/utils.dart';
export 'package:tic_tac_toe/utils/utils.dart';

enum states{vacio,cross,circule}

List<states> board = List.filled(9, states.vacio);
Map<states, bool> rest = {states.cross: false, states.circule: false};

Map<states, int> score = {states.cross: 0, states.circule: 0, states.vacio: 0};

states start = states.cross;

int count = 0;
class Config {

}