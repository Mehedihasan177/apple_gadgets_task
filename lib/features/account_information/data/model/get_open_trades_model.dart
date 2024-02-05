// To parse this JSON data, do
//
//     final getOpenTradesModel = getOpenTradesModelFromJson(jsonString);

import 'dart:convert';

List<GetOpenTradesModel> getOpenTradesModelFromJson(String str) => List<GetOpenTradesModel>.from(json.decode(str).map((x) => GetOpenTradesModel.fromJson(x)));

String getOpenTradesModelToJson(List<GetOpenTradesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetOpenTradesModel {
    double? currentPrice;
    dynamic? comment;
    int? digits;
    int? login;
    double? openPrice;
    var openTime;
    var profit;
    var sl;
    var swaps;
    String? symbol;
    var tp;
    int? ticket;
    int? type;
    double? volume;

    GetOpenTradesModel({
        this.currentPrice,
        this.comment,
        this.digits,
        this.login,
        this.openPrice,
        this.openTime,
        this.profit,
        this.sl,
        this.swaps,
        this.symbol,
        this.tp,
        this.ticket,
        this.type,
        this.volume,
    });

    factory GetOpenTradesModel.fromJson(Map<String, dynamic> json) => GetOpenTradesModel(
        currentPrice: json["currentPrice"]?.toDouble(),
        comment: json["comment"],
        digits: json["digits"],
        login: json["login"],
        openPrice: json["openPrice"]?.toDouble(),
        openTime: DateTime.parse(json["openTime"]),
        profit: json["profit"]?.toDouble(),
        sl: json["sl"]?.toDouble(),
        swaps: json["swaps"]?.toDouble(),
        symbol: json["symbol"],
        tp: json["tp"],
        ticket: json["ticket"],
        type: json["type"],
        volume: json["volume"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "currentPrice": currentPrice,
        "comment": comment,
        "digits": digits,
        "login": login,
        "openPrice": openPrice,
        "openTime": openTime?.toIso8601String(),
        "profit": profit,
        "sl": sl,
        "swaps": swaps,
        "symbol": symbol,
        "tp": tp,
        "ticket": ticket,
        "type": type,
        "volume": volume,
    };
}
