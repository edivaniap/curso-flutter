import 'dart:ffi';

import 'package:ilovetv_flutter/src/model/episode.dart';
import 'package:ilovetv_flutter/src/model/tv_datail.dart';

class TvDatailResponse {

    final TvDetail tvDetail;
    final String error;

    TvDatailResponse(
      this.tvDetail,
      this.error
    );

    TvDatailResponse.fromJson(Map<String, dynamic> json)
      : tvDetail = TvDetail.fromJson(json),
        error = "";

    TvDatailResponse.withError(String e)
      : tvDetail = TvDetail(-1, -1, -1, -1, false, false, "", "", "", Episode(), [], [], [], [], []),
        error = e;

}