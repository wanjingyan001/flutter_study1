class WeatherResult {
  String resultcode;
  String reason;
  Result result;
  int errorCode;

  WeatherResult({this.resultcode, this.reason, this.result, this.errorCode});

  WeatherResult.fromJson(Map<String, dynamic> json) {
    resultcode = json['resultcode'];
    reason = json['reason'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultcode'] = this.resultcode;
    data['reason'] = this.reason;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['error_code'] = this.errorCode;
    return data;
  }
}

class Result {
  Sk sk;
  Today today;
  List<FutureBean> future;

  Result({this.sk, this.today, this.future});

  Result.fromJson(Map<String, dynamic> json) {
    sk = json['sk'] != null ? new Sk.fromJson(json['sk']) : null;
    today = json['today'] != null ? new Today.fromJson(json['today']) : null;
    if (json['future'] != null) {
      future = new List<FutureBean>();
      if (json['future'] != null) {
        json['future'].forEach((v) {
          future.add(new FutureBean.fromJson(v));
        });
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sk != null) {
      data['sk'] = this.sk.toJson();
    }
    if (this.today != null) {
      data['today'] = this.today.toJson();
    }
    if (this.future != null) {
      data['future'] = this.future.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sk {
  String temp;
  String windDirection;
  String windStrength;
  String humidity;
  String time;

  Sk(
      {this.temp,
      this.windDirection,
      this.windStrength,
      this.humidity,
      this.time});

  Sk.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    windDirection = json['wind_direction'];
    windStrength = json['wind_strength'];
    humidity = json['humidity'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['wind_direction'] = this.windDirection;
    data['wind_strength'] = this.windStrength;
    data['humidity'] = this.humidity;
    data['time'] = this.time;
    return data;
  }
}

class Today {
  String city;
  String dateY;
  String week;
  String temperature;
  String weather;
  WeatherId weatherId;
  String wind;
  String dressingIndex;
  String dressingAdvice;
  String uvIndex;
  String comfortIndex;
  String washIndex;
  String travelIndex;
  String exerciseIndex;
  String dryingIndex;

  Today(
      {this.city,
      this.dateY,
      this.week,
      this.temperature,
      this.weather,
      this.weatherId,
      this.wind,
      this.dressingIndex,
      this.dressingAdvice,
      this.uvIndex,
      this.comfortIndex,
      this.washIndex,
      this.travelIndex,
      this.exerciseIndex,
      this.dryingIndex});

  Today.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    dateY = json['date_y'];
    week = json['week'];
    temperature = json['temperature'];
    weather = json['weather'];
    weatherId = json['weather_id'] != null
        ? new WeatherId.fromJson(json['weather_id'])
        : null;
    wind = json['wind'];
    dressingIndex = json['dressing_index'];
    dressingAdvice = json['dressing_advice'];
    uvIndex = json['uv_index'];
    comfortIndex = json['comfort_index'];
    washIndex = json['wash_index'];
    travelIndex = json['travel_index'];
    exerciseIndex = json['exercise_index'];
    dryingIndex = json['drying_index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['date_y'] = this.dateY;
    data['week'] = this.week;
    data['temperature'] = this.temperature;
    data['weather'] = this.weather;
    if (this.weatherId != null) {
      data['weather_id'] = this.weatherId.toJson();
    }
    data['wind'] = this.wind;
    data['dressing_index'] = this.dressingIndex;
    data['dressing_advice'] = this.dressingAdvice;
    data['uv_index'] = this.uvIndex;
    data['comfort_index'] = this.comfortIndex;
    data['wash_index'] = this.washIndex;
    data['travel_index'] = this.travelIndex;
    data['exercise_index'] = this.exerciseIndex;
    data['drying_index'] = this.dryingIndex;
    return data;
  }
}

class WeatherId {
  String fa;
  String fb;

  WeatherId({this.fa, this.fb});

  WeatherId.fromJson(Map<String, dynamic> json) {
    fa = json['fa'];
    fb = json['fb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fa'] = this.fa;
    data['fb'] = this.fb;
    return data;
  }
}

class FutureBean {
  String temperature;
  String weather;
  WeatherId weatherId;
  String wind;
  String week;
  String date;

  FutureBean(
      {this.temperature,
      this.weather,
      this.weatherId,
      this.wind,
      this.week,
      this.date});

  FutureBean.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    weather = json['weather'];
    weatherId = json['weather_id'] != null
        ? new WeatherId.fromJson(json['weather_id'])
        : null;
    wind = json['wind'];
    week = json['week'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temperature'] = this.temperature;
    data['weather'] = this.weather;
    if (this.weatherId != null) {
      data['weather_id'] = this.weatherId.toJson();
    }
    data['wind'] = this.wind;
    data['week'] = this.week;
    data['date'] = this.date;
    return data;
  }
}
