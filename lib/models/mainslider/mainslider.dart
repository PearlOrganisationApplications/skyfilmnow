class PosterData {
  String? response;
  List<Message>? message;

  PosterData({this.response, this.message});

  PosterData.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(new Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  String? id;
  String? poster;
  String? msName;
  String? type;
  String? status;
  String? mid;
  String? created;

  Message(
      {this.id,
      this.poster,
      this.msName,
      this.type,
      this.status,
      this.mid,
      this.created});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    poster = json['poster'];
    msName = json['ms_name'];
    type = json['type'];
    status = json['status'];
    mid = json['mid'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['poster'] = poster;
    data['ms_name'] = msName;
    data['type'] = type;
    data['status'] = status;
    data['mid'] = mid;
    data['created'] = created;
    return data;
  }
}
