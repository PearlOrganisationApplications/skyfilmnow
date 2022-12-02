class PosterDetails {
  String? response;
  Message? message;

  PosterDetails({this.response, this.message});

  PosterDetails.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class Message {
  String? id;
  String? movieTypeReal;
  String? movId;
  String? movName;
  Data? data;
  String? slug;
  String? status;
  String? orderInc;
  String? movCaty;
  String? movieType;
  String? createdDate;

  Message(
      {this.id,
      this.movieTypeReal,
      this.movId,
      this.movName,
      this.data,
      this.slug,
      this.status,
      this.orderInc,
      this.movCaty,
      this.movieType,
      this.createdDate});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    movieTypeReal = json['movie_type_real'];
    movId = json['mov_id'];
    movName = json['mov_name'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    slug = json['slug'];
    status = json['status'];
    orderInc = json['order_inc'];
    movCaty = json['mov_caty'];
    movieType = json['movie_type'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['movie_type_real'] = this.movieTypeReal;
    data['mov_id'] = this.movId;
    data['mov_name'] = this.movName;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['order_inc'] = this.orderInc;
    data['mov_caty'] = this.movCaty;
    data['movie_type'] = this.movieType;
    data['created_date'] = this.createdDate;
    return data;
  }
}

class Data {
  String? movId;
  String? movieTpe;
  String? poster;
  String? movName;
  String? movType;
  String? product;
  String? movTime;
  String? ages;
  String? genre;
  String? director;
  String? story;
  String? alert;
  String? language;
  String? yop;
  String? imdbRating;
  String? ratingCount;
  String? metacriticScore;
  String? metacriticUser;
  String? tomatometer;
  String? tomatoReview;
  String? topCast;
  String? castImage;
  String? dubLang;
  List<String>? movCat;
  String? dedicate1;
  String? subtitle1;
  String? encoder1;
  String? dubbed1;
  String? movieType1;
  String? totalpart;
  String? subUpl1;

  Data(
      {this.movId,
      this.movieTpe,
      this.poster,
      this.movName,
      this.movType,
      this.product,
      this.movTime,
      this.ages,
      this.genre,
      this.director,
      this.story,
      this.alert,
      this.language,
      this.yop,
      this.imdbRating,
      this.ratingCount,
      this.metacriticScore,
      this.metacriticUser,
      this.tomatometer,
      this.tomatoReview,
      this.topCast,
      this.castImage,
      this.dubLang,
      this.movCat,
      this.dedicate1,
      this.subtitle1,
      this.encoder1,
      this.dubbed1,
      this.movieType1,
      this.totalpart,
      this.subUpl1});

  Data.fromJson(Map<String, dynamic> json) {
    movId = json['mov_id'];
    movieTpe = json['movie_tpe'];
    poster = json['poster'];
    movName = json['mov_name'];
    movType = json['mov_type'];
    product = json['product'];
    movTime = json['mov_time'];
    ages = json['ages'];
    genre = json['genre'];
    director = json['director'];
    story = json['story'];
    alert = json['alert'];
    language = json['language'];
    yop = json['yop'];
    imdbRating = json['imdb_rating'];
    ratingCount = json['rating_count'];
    metacriticScore = json['metacritic_score'];
    metacriticUser = json['metacritic_user'];
    tomatometer = json['tomatometer'];
    tomatoReview = json['tomato_review'];
    topCast = json['top_cast'];
    castImage = json['cast_image'];
    dubLang = json['dub_lang'];
    movCat = json['mov_cat'].cast<String>();
    dedicate1 = json['dedicate1'];
    subtitle1 = json['subtitle1'];
    encoder1 = json['encoder1'];
    dubbed1 = json['dubbed1'];
    movieType1 = json['movie_type1'];
    totalpart = json['totalpart'];
    subUpl1 = json['sub_upl1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mov_id'] = this.movId;
    data['movie_tpe'] = this.movieTpe;
    data['poster'] = this.poster;
    data['mov_name'] = this.movName;
    data['mov_type'] = this.movType;
    data['product'] = this.product;
    data['mov_time'] = this.movTime;
    data['ages'] = this.ages;
    data['genre'] = this.genre;
    data['director'] = this.director;
    data['story'] = this.story;
    data['alert'] = this.alert;
    data['language'] = this.language;
    data['yop'] = this.yop;
    data['imdb_rating'] = this.imdbRating;
    data['rating_count'] = this.ratingCount;
    data['metacritic_score'] = this.metacriticScore;
    data['metacritic_user'] = this.metacriticUser;
    data['tomatometer'] = this.tomatometer;
    data['tomato_review'] = this.tomatoReview;
    data['top_cast'] = this.topCast;
    data['cast_image'] = this.castImage;
    data['dub_lang'] = this.dubLang;
    data['mov_cat'] = this.movCat;
    data['dedicate1'] = this.dedicate1;
    data['subtitle1'] = this.subtitle1;
    data['encoder1'] = this.encoder1;
    data['dubbed1'] = this.dubbed1;
    data['movie_type1'] = this.movieType1;
    data['totalpart'] = this.totalpart;
    data['sub_upl1'] = this.subUpl1;
    return data;
  }
}
