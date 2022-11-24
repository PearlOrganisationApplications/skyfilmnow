import 'dart:convert';

MainSlider mainSliderFromJson(String str) =>
    MainSlider.fromJson(json.decode(str));

String mainSliderToJson(MainSlider data) => json.encode(data.toJson());

class MainSlider {
  MainSlider({
    required this.response,
    required this.message,
  });

  String response;
  Message message;

  factory MainSlider.fromJson(Map<String, dynamic> json) => MainSlider(
        response: json["response"],
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "message": message.toJson(),
      };
}

class Message {
  Message({
    required this.the0,
    required this.the1,
    required this.the2,
    required this.posterData,
  });

  The0 the0;
  The0 the1;
  The0 the2;
  MessagePosterData posterData;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        the0: The0.fromJson(json["0"]),
        the1: The0.fromJson(json["1"]),
        the2: The0.fromJson(json["2"]),
        posterData: MessagePosterData.fromJson(jsonDecode(json["poster_data"])),
      );

  Map<String, dynamic> toJson() => {
        "0": the0.toJson(),
        "1": the1.toJson(),
        "2": the2.toJson(),
        "poster_data": posterData.toJson(),
      };
}

class MessagePosterData {
  MessagePosterData({
    required this.id,
    required this.serialTypeReal,
    required this.serId,
    required this.serName,
    required this.season,
    required this.data,
    required this.slug,
    required this.status,
    required this.serCaty,
    required this.orderInc,
    required this.createdDate,
  });

  int id;
  String serialTypeReal;
  String serId;
  String serName;
  String season;
  String data;
  String slug;
  String status;
  String serCaty;
  String orderInc;
  DateTime createdDate;

  factory MessagePosterData.fromJson(Map<String, dynamic> json) =>
      MessagePosterData(
        id: int.parse(json["id"]),
        serialTypeReal: json["serial_type_real"],
        serId: json["ser_id"],
        serName: json["ser_name"],
        season: json["season"],
        data: json["data"],
        slug: json["slug"],
        status: json["status"],
        serCaty: json["ser_caty"],
        orderInc: json["order_inc"],
        createdDate: DateTime.parse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "serial_type_real": serialTypeReal,
        "ser_id": serId,
        "ser_name": serName,
        "season": season,
        "data": data,
        "slug": slug,
        "status": status,
        "ser_caty": serCaty,
        "order_inc": orderInc,
        "created_date":
            "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
      };
}

class The0 {
  The0({
    required this.id,
    required this.poster,
    required this.msName,
    required this.type,
    required this.status,
    required this.mid,
    required this.created,
    required this.posterData,
  });

  int id;
  String poster;
  String msName;
  String type;
  String status;
  String mid;
  DateTime created;
  The0PosterData posterData;

  factory The0.fromJson(Map<String, dynamic> json) => The0(
        id: int.parse(json["id"]),
        poster: json["poster"],
        msName: json["ms_name"],
        type: json["type"],
        status: json["status"],
        mid: json["mid"],
        created: DateTime.parse(json["created"]),
        posterData:
            json[The0PosterData.fromJson(jsonDecode(json["poster_data"]))],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "poster": poster,
        "ms_name": msName,
        "type": type,
        "status": status,
        "mid": mid,
        "created":
            "${created.year.toString().padLeft(4, '0')}-${created.month.toString().padLeft(2, '0')}-${created.day.toString().padLeft(2, '0')}",
        "poster_data": posterData == null ? null : posterData.toJson(),
      };
}

class The0PosterData {
  The0PosterData({
    required this.id,
    required this.movieTypeReal,
    required this.movId,
    required this.movName,
    required this.data,
    required this.slug,
    required this.status,
    required this.orderInc,
    required this.movCaty,
    required this.movieType,
    required this.createdDate,
  });

  int id;
  String movieTypeReal;
  String movId;
  String movName;
  String data;
  String slug;
  String status;
  String orderInc;
  String movCaty;
  String movieType;
  DateTime createdDate;

  factory The0PosterData.fromJson(Map<String, dynamic> json) => The0PosterData(
        id: int.parse(json["id"]),
        movieTypeReal: json["movie_type_real"],
        movId: json["mov_id"],
        movName: json["mov_name"],
        data: json["data"],
        slug: json["slug"],
        status: json["status"],
        orderInc: json["order_inc"],
        movCaty: json["mov_caty"],
        movieType: json["movie_type"],
        createdDate: DateTime.parse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "movie_type_real": movieTypeReal,
        "mov_id": movId,
        "mov_name": movName,
        "data": data,
        "slug": slug,
        "status": status,
        "order_inc": orderInc,
        "mov_caty": movCaty,
        "movie_type": movieType,
        "created_date":
            "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
      };
}
