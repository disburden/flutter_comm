import 'package:flutter/material.dart';

/// 时间类型
enum TimeStyle {
	/// 13:31 08/09
	HOUR_mh_MI_kg_MO_xg_DAY,

	/// 2018-08-09 13:31
	YEAR_hg_MO_hg_DAY_kg_HOUR_mh_MI,

	/// 2018.08
	YEAR_dot_MO,

	/// 20180809
	YEAR_MO_DAY,

	/// 13:31:33
	HOUR_mh_MI_mh_SE,

	/// 2018-08-09
	YEAR_hg_MO_hg_DAY,

	/// 2018/08/09
	YEAR_xg_MO_xg_DAY,

	/// 计算到现在的时间差(几分钟前,几天前,几个月前....)
	DIFF,

	/// 获取到现在的时间差的毫秒值
	DIFF_MILLISECOND,
}

/// 时间工具
class FCTime {
	/// 格式化时间类型
	static String formatDateTime({@required String dateTimeString, @required TimeStyle style}) {
		DateTime dt = DateTime.parse(dateTimeString);
		int i_hour = dt.hour;
		int i_min = dt.minute;
		int i_year = dt.year;
		int i_moo = dt.month;
		int i_day = dt.day;
		int i_sec = dt.second;

		String hour = (i_hour < 10) ? "0$i_hour" : i_hour.toString();
		String min = (i_min < 10) ? "0$i_min" : i_min.toString();
		String year = i_year.toString();
		String moo = (i_moo < 10) ? "0$i_moo" : i_moo.toString();
		String day = (i_day < 10) ? "0$i_day" : i_day.toString();
		String sec = i_sec.toString();

		switch (style) {
			case TimeStyle.HOUR_mh_MI_kg_MO_xg_DAY:
				return "$hour:$min $moo/$day";
			case TimeStyle.YEAR_hg_MO_hg_DAY_kg_HOUR_mh_MI:
				return "$year-$moo-$day $hour:$min";
			case TimeStyle.YEAR_dot_MO:
				return "$year.$moo";
			case TimeStyle.YEAR_MO_DAY:
				return "$year$moo$day";
			case TimeStyle.HOUR_mh_MI_mh_SE:
				return "$hour:$min:$sec";
			case TimeStyle.YEAR_hg_MO_hg_DAY:
				return "$year-$moo-$day";
			case TimeStyle.YEAR_xg_MO_xg_DAY:
				return "$year/$moo/$day";
			case TimeStyle.DIFF:
				{
					// 将日期转成时间戳
					int flagTimeStamp = dt.millisecondsSinceEpoch;
					// 获取当前日期
					DateTime now = DateTime.now();
					int nowTimeStamp = now.millisecondsSinceEpoch;
					// 计算两个时间相差的毫秒数
					int timeDiff = nowTimeStamp - flagTimeStamp;
					// 将毫秒转成秒
					timeDiff = timeDiff ~/ 1000;
					if (timeDiff / 3600 < 1) {
						return '${timeDiff ~/ 60}分钟前';
					}
					if (timeDiff / 3600 > 1 && timeDiff / 86400 < 1) {
						return '${timeDiff ~/ 3600}小时前';
					}
					if (timeDiff / 86400 > 1 && timeDiff / 2592000 < 1) {
						return '${timeDiff ~/ 86400}天前';
					}
					if ((timeDiff / 2592000 > 1 && timeDiff / 31104000 < 1)) {
						return '${timeDiff ~/ 2592000}个月前';
					}
					if (timeDiff / 31104000 > 1) {
						return '${timeDiff ~/ 31104000}年前';
					}
				}
				break;

			case TimeStyle.DIFF_MILLISECOND:
				{
					// 将日期转成时间戳
					int flagTimeStamp = dt.millisecondsSinceEpoch;
					// 获取当前日期
					DateTime now = DateTime.now();
					int nowTimeStamp = now.millisecondsSinceEpoch;
					// 计算两个时间相差的毫秒数
					int timeDiff = nowTimeStamp - flagTimeStamp;
					return (timeDiff.abs()).toString();
				}
				break;
		}
		return dateTimeString;
	}
}