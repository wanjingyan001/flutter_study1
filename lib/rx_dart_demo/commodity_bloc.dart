import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:study1/rx_dart_demo/move_bean.dart';
import 'package:study1/rx_dart_demo/request_state.dart';
import 'package:study1/util/util.dart';

class CommodityBloc {
  final Sink<String> searchKey;
  final Stream<RequestState> data;

  CommodityBloc._(this.searchKey, this.data);

  factory CommodityBloc() {
    final seachKey = PublishSubject<String>();
    final state = seachKey
        .distinct()
        .debounce(Duration(milliseconds: 200))
        .switchMap((key) => _getData(key))
        .startWith(RequestInitial());

    return CommodityBloc._(seachKey, state);
  }

  void dispose() {
    searchKey.close();
  }

  static Stream<RequestState> _getData(String key) async* {
    try {
      if (key.isEmpty) {
        yield RequestInitial();
      } else {
        Dio dio = DioSingleton().httpDio();
        Response response = await dio.get('movie/index', data: {
          'key': 'b3692ee12dc955706edf1a6cbfca0eda',
          'smode': 1,
          'title': key
        });
        switch (response.statusCode) {
          case 200:
            MoveBean bean = MoveBean.fromJson(response.data);
            yield RequestPopulated<MoveBean>(resultData: bean);
            break;
          default:
            yield RequestEmpty();
            break;
        }
      }
    } catch (e) {
      yield RequestError();
    }
  }
}
