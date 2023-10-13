// ignore_for_file: sort_constructors_first

import 'package:equatable/equatable.dart';

class CoinsModel extends Equatable {
  final String? type;
  final int? sequence;
  final String? productId;
  final String? price;
  final String? open24h;
  final String? volume24h;
  final String? low24h;
  final String? high24h;
  final String? volume30d;
  final String? bestBid;
  final String? bestBidSize;
  final String? bestAsk;
  final String? bestAskSize;
  final String? side;
  final DateTime? time;
  final int? tradeId;
  final String? lastSize;

  const CoinsModel({
    this.type,
    this.sequence,
    this.productId,
    this.price,
    this.open24h,
    this.volume24h,
    this.low24h,
    this.high24h,
    this.volume30d,
    this.bestBid,
    this.bestBidSize,
    this.bestAsk,
    this.bestAskSize,
    this.side,
    this.time,
    this.tradeId,
    this.lastSize,
  });

  factory CoinsModel.fromJson(Map<String, dynamic> json) => CoinsModel(
        type: json['type'] as String?,
        sequence: json['sequence'] as int?,
        productId: json['product_id'] as String?,
        price: json['price'] as String?,
        open24h: json['open_24h'] as String?,
        volume24h: json['volume_24h'] as String?,
        low24h: json['low_24h'] as String?,
        high24h: json['high_24h'] as String?,
        volume30d: json['volume_30d'] as String?,
        bestBid: json['best_bid'] as String?,
        bestBidSize: json['best_bid_size'] as String?,
        bestAsk: json['best_ask'] as String?,
        bestAskSize: json['best_ask_size'] as String?,
        side: json['side'] as String?,
        time: json['time'] == null
            ? null
            : DateTime.parse(json['time'] as String),
        tradeId: json['trade_id'] as int?,
        lastSize: json['last_size'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'sequence': sequence,
        'product_id': productId,
        'price': price,
        'open_24h': open24h,
        'volume_24h': volume24h,
        'low_24h': low24h,
        'high_24h': high24h,
        'volume_30d': volume30d,
        'best_bid': bestBid,
        'best_bid_size': bestBidSize,
        'best_ask': bestAsk,
        'best_ask_size': bestAskSize,
        'side': side,
        'time': time?.toIso8601String(),
        'trade_id': tradeId,
        'last_size': lastSize,
      };

  CoinsModel copyWith({
    String? type,
    int? sequence,
    String? productId,
    String? price,
    String? open24h,
    String? volume24h,
    String? low24h,
    String? high24h,
    String? volume30d,
    String? bestBid,
    String? bestBidSize,
    String? bestAsk,
    String? bestAskSize,
    String? side,
    DateTime? time,
    int? tradeId,
    String? lastSize,
  }) {
    return CoinsModel(
      type: type ?? this.type,
      sequence: sequence ?? this.sequence,
      productId: productId ?? this.productId,
      price: price ?? this.price,
      open24h: open24h ?? this.open24h,
      volume24h: volume24h ?? this.volume24h,
      low24h: low24h ?? this.low24h,
      high24h: high24h ?? this.high24h,
      volume30d: volume30d ?? this.volume30d,
      bestBid: bestBid ?? this.bestBid,
      bestBidSize: bestBidSize ?? this.bestBidSize,
      bestAsk: bestAsk ?? this.bestAsk,
      bestAskSize: bestAskSize ?? this.bestAskSize,
      side: side ?? this.side,
      time: time ?? this.time,
      tradeId: tradeId ?? this.tradeId,
      lastSize: lastSize ?? this.lastSize,
    );
  }

  @override
  List<Object?> get props {
    return [
      type,
      sequence,
      productId,
      price,
      open24h,
      volume24h,
      low24h,
      high24h,
      volume30d,
      bestBid,
      bestBidSize,
      bestAsk,
      bestAskSize,
      side,
      time,
      tradeId,
      lastSize,
    ];
  }
}
