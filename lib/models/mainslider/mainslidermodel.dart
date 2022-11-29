class MainSliderModel {
  String response;
  List<MessageData> messagedata;

  MainSliderModel({
    required this.response,
    required this.messagedata,
  });
  factory MainSliderModel.fromjson(Map<String, dynamic> json) =>
      MainSliderModel(
          response: json['response'],
          messagedata: List<MessageData>.from(
              json['message'].map((x) => MessageData.fromjson(x))));

  Map<String, dynamic> toJson() => {
        "response": response,
        "message": List<dynamic>.from(messagedata.map((x) => x.toJson())),
      };
}

class MessageData {
  List<The0> the0;
  List<The0> the1;
  List<The0> the2;
  List<MessagePoster> messageposter;

  MessageData({
    required this.the0,
    required this.the1,
    required this.the2,
    required this.messageposter,
  });

  factory MessageData.fromjson(Map<String, dynamic> json) => MessageData(
      the0:
          List<The0>.from(json['message']['the0'].map((x) => The0.fromJson(x))),
      the1:
          List<The0>.from(json['message']['the0'].map((x) => The0.fromJson(x))),
      the2:
          List<The0>.from(json['message']['the0'].map((x) => The0.fromJson(x))),
      messageposter: List<MessagePoster>.from(
          json['message']['the0'].map((x) => The0.fromJson(x))));
  Map<String, dynamic> toJson() => {
        "0": List<dynamic>.from(the0.map((x) => x.toJson())),
        "1": List<dynamic>.from(the1.map((x) => x.toJson())),
        "2": List<dynamic>.from(the2.map((x) => x.toJson())),
        "poster_data": List<dynamic>.from(messageposter.map((x) => x.toJson())),
      };
}

class MessagePoster {
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

  MessagePoster({
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
  factory MessagePoster.fromJson(Map<String, dynamic> json) => MessagePoster(
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
  String id;
  String poster;
  String msName;
  String type;
  String status;
  String mid;
  DateTime created;
  List<The0Poster> posterData;

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
  factory The0.fromJson(Map<String, dynamic> json) => The0(
      id: (json["id"]),
      poster: json["poster"],
      msName: json["ms_name"],
      type: json["type"],
      status: json["status"],
      mid: json["mid"],
      created: DateTime.parse(json["created"]),
      posterData: List<The0Poster>.from(
          json['message'].map((x) => The0Poster.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "id": id,
        "poster": poster,
        "ms_name": msName,
        "type": type,
        "status": status,
        "mid": mid,
        "created":
            "${created.year.toString().padLeft(4, '0')}-${created.month.toString().padLeft(2, '0')}-${created.day.toString().padLeft(2, '0')}",
        "poster_data": List<dynamic>.from(posterData.map((x) => x.toJson())),
      };
}

class The0Poster {
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
  The0Poster({
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
  factory The0Poster.fromJson(Map<String, dynamic> json) => The0Poster(
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
