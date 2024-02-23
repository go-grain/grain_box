import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

class GDateTime {
  static String getWeekday(String key) {
    final List<String> weekdays = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
    try {
      var d = getDateYMD2Time(key);
      return weekdays[d.weekday - 1];
    } catch (e) {
      print(e);
      return "";
    }
  }

  static String getDateYMD(String dateString) {
    // 使用 yyyy-M-d 格式解析日期字符串
    final DateFormat parser1 = DateFormat('yyyy-MM-dd');
    final DateFormat parser2 = DateFormat('yyyy-M-d');

    try {
      // 尝试解析为 yyyy-M-d 格式
      var now = parser1.parse(dateString);
      return parser1.format(now);
    } catch (e) {
      // 如果解析失败，尝试解析为 yyyy-MM-dd 格式
      try {
        var now = parser2.parse(dateString);
        return parser2.format(now);
      } catch (e) {
        // 如果两种格式都无法解析，返回 false
        return "";
      }
    }
  }

  static String getDateYM(String dateString) {
    // 使用 yyyy-M-d 格式解析日期字符串
    final DateFormat parser1 = DateFormat('yyyy-MM');
    final DateFormat parser2 = DateFormat('yyyy-M');

    try {
      // 尝试解析为 yyyy-M 格式
      var now = parser1.parse(dateString);
      return parser1.format(now);
    } catch (e) {
      // 如果解析失败，尝试解析为 yyyy-MM 格式
      try {
        var now = parser2.parse(dateString);
        return parser2.format(now);
      } catch (e) {
        // 如果两种格式都无法解析，返回 false
        return "";
      }
    }
  }

  static String getDateYMDHMS(String dateString) {
    // 使用 yyyy-M-d 格式解析日期字符串
    final DateFormat parser1 = DateFormat('yyyy-MM-dd HH:mm:ss');
    final DateFormat parser2 = DateFormat('yyyy-M-d HH:mm:ss');

    try {
      // 尝试解析为 yyyy-M-d 格式
      var now = parser1.parse(dateString);
      return parser1.format(now);
    } catch (e) {
      // 如果解析失败，尝试解析为 yyyy-MM-dd 格式
      try {
        var now = parser2.parse(dateString);
        return parser2.format(now);
      } catch (e) {
        // 如果两种格式都无法解析，返回 false
        return "";
      }
    }
  }

  static DateTime getDateYMD2Time(String dateString) {
    // 使用 yyyy-M-d 格式解析日期字符串
    final DateFormat parser1 = DateFormat('yyyy-M-d');
    final DateFormat parser2 = DateFormat('yyyy-MM-dd');

    try {
      // 尝试解析为 yyyy-M-d 格式
      var now = parser1.parse(dateString);
      return now;
    } catch (e) {
      // 如果解析失败，尝试解析为 yyyy-MM-dd 格式
      try {
        var now = parser2.parse(dateString);
        return now;
      } catch (e) {
        // 如果两种格式都无法解析，返回 false
        return DateTime.now();
      }
    }
  }

  static DateTime getStrToDateTime(String dateString) {
    // 使用 yyyy-M-d 格式解析日期字符串
    final DateFormat parser1 = DateFormat('yyyy-M-d');
    final DateFormat parser2 = DateFormat('yyyy-MM-dd');

    try {
      // 尝试解析为 yyyy-M-d 格式
      var now = parser1.parse(dateString);
      return now;
    } catch (e) {
      // 如果解析失败，尝试解析为 yyyy-MM-dd 格式
      try {
        var now = parser2.parse(dateString);
        return now;
      } catch (e) {
        // 如果两种格式都无法解析，返回 false
        return DateTime.now();
      }
    }
  }

  static String to(String data) {
    if (data.length == 1) {
      return "0$data";
    } else {
      return data;
    }
  }

  static String getStrDate(DateTime dateTime) {
    return "${dateTime.year}-${to(dateTime.month.toString())}-${to(dateTime.day.toString())}";
  }

  static Map<String, String> weekDay = {
    "${DateTime.now().year}-${to(DateTime.now().month.toString())}-${to(DateTime.now().day.toString())}":
        "今天",
    "${DateTime.now().year}-${to(DateTime.now().month.toString())}-${to((DateTime.now().day - 1).toString())}":
        "昨天",
    "${DateTime.now().year}-${to(DateTime.now().month.toString())}-${to((DateTime.now().day - 2).toString())}":
        "前天",
  };
}

class MyDate {
  static String MyformatDate(int? time) {
    if (time == 0 || time == null) {
      return "未知";
    }
    String string = formatDate(DateTime.fromMillisecondsSinceEpoch(time),
        [yyyy, '年', m, '月', d, '日 ', H, ':', nn]);
    return string;
  }

  static String date(int? time) {
    if (time == 0 || time == null) {
      return "未知";
    }
    String string = formatDate(DateTime.fromMillisecondsSinceEpoch(time),
        [yyyy, '-', m, '-', d, ' ', H, ':', nn]);
    return string;
  }

  static String MyformatDate2(int time) {
    String string = formatDate(
        DateTime.fromMillisecondsSinceEpoch(time), [yyyy, '-', m, '-', d]);
    return string;
  }

  static String DateMD(int? time) {
    String string = formatDate(
        DateTime.fromMillisecondsSinceEpoch(time!), [m, '月', d, '日']);
    return string;
  }

  static String DateMDHS(int? time) {
    String string = formatDate(DateTime.fromMillisecondsSinceEpoch(time!),
        [m, '月', d, '日', HH, ':', nn]);
    return string;
  }

  static String DateHHSS(int time) {
    String string = formatDate(
        DateTime.fromMillisecondsSinceEpoch(time), [HH, ':', nn, ':', ss]);
    return string;
  }

  static String getChatTime(int time) {
    if (time == 0) {
      return "";
    }
    var str = DateMD(time);
    var str1 = DateMD(timestamp());
    if (str == str1) {
      return "今天 ${DateHHSS(time)}";
    }
    var y = DateTime.now();
    var t = DateTime(y.year, y.month, y.year - 1).millisecondsSinceEpoch;
    str = DateMD(t);
    str1 = DateMD(timestamp());
    if (str == str1) {
      return "昨天 ${DateHHSS(time)}";
    } else {
      date(time);
    }
    return date(time);
  }

  static String golangFormatDate(String? time) {
    String string = formatDate(
        DateTime.parse(time!), [yyyy, '年', m, '月', d, '日 ', H, ':', nn]);
    return string;
  }

  static String dartFormatDate(String? time) {
    String string =
        formatDate(DateTime.parse(time!), [yyyy, '年', m, '月', d, '日 ']);
    return string;
  }

  static int timestamp() {
    var now = DateTime.now();
    return now.millisecondsSinceEpoch;
  }

  static int microsecondsSinceEpoch() {
    var now = DateTime.now();
    return now.microsecondsSinceEpoch;
  }

  static String intToTime(dynamic seconds) {
    int day = seconds ~/ 3600 ~/ 24;
    int hour = seconds ~/ 3600 % 24;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    if (day != 0) {
      return formatTime(day) +
          '天' +
          formatTime(hour) +
          "小时" +
          formatTime(minute) +
          "分" +
          formatTime(second) +
          '秒';
    } else if (hour != 0) {
      return formatTime(hour) +
          "小时" +
          formatTime(minute) +
          "分" +
          formatTime(second) +
          '秒';
    } else if (minute != 0) {
      return minute.toString() + "分" + formatTime(second) + '秒';
    } else if (second != 0) {
      return formatTime(second) + '秒';
    } else {
      return '';
    }
  }

  //数字格式化，将 0~9 的时间转换为 00~09
  static String formatTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }

  static taskTime(dynamic time) {
    var str = (time / 60).toStringAsFixed(2);
    if (time < 60) {
      return "${time}分钟";
    }
    var tmp = str.split(".");
    if (str.contains(".")) {
      if ((time / 60) > 24) {
        var tmp = ((time / 60) / 24).toStringAsFixed(2).split(".");
        if (tmp.length == 2) {
          if (int.parse(tmp[1]) < 0.1) {
            return "${((time / 60) / 24).toStringAsFixed(0)}天";
          } else {
            return "${((time / 60) / 24).toStringAsFixed(2)}天";
          }
        } else {
          return "${((time / 60) / 24).toStringAsFixed(0)}天";
        }
      } else if (int.parse(tmp[1]) < 0.1) {
        return "${tmp[0]}小时";
      } else {
        if ((time / 60) > 24) {
          return "${((time / 60) / 24).toStringAsFixed(2)}天";
        } else {
          var s = int.parse(str.substring(str.length - 1, str.length));
          if (s >= 1) {
            return "${(time / 60).toStringAsFixed(2)}小时";
          } else {
            return "${(time / 60).toStringAsFixed(1)}小时";
          }
        }
      }
    }
  }
}
