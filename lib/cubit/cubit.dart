// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, avoid_print, duplicate_ignore

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metals_price/cubit/states.dart';
import 'package:metals_price/network/dio_helper.dart';

class MainCubit extends Cubit<States> {
  MainCubit() : super(InitState());

  static MainCubit get(context) => BlocProvider.of(context);

  double? goldD;
  int? goldI;

  double? silverD;
  int? silverI;

  getGoldPrice() {
    DioHelper.getData('XAU/USD/').then((value) {
      goldD = value.data['price'];
      goldI = goldD!.round();
      print(goldI);
      emit(GetGoldPriceState());
    }).catchError((error) {
      print(error.toString());
    });
  }

  getSilverPrice() {
    DioHelper.getData('XAG/USD/').then((value) {
      silverD = value.data['price'];
      silverI = silverD!.round();
      print(silverI);
      emit(GetSilverPriceState());
    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
    }).catchError((error) {
      print(error.toString());
    });
  }
}
