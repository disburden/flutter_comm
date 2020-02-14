import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart' as cptn;

typedef finishSelect<I,T> = void Function(I idex,T value);

class FCPicker {
	final BuildContext ctx;
	final List<String> dataSource;
	final finishSelect<int,String> selectDone;
	int defaultValueIndex;

	TextStyle buttonTextStyle;
	

	double _kPickerSheetHeight = 216.0;
	double _kPickerItemHeight = 32.0;
	FCPicker({
		@required this.ctx,
		@required this.dataSource,
		@required this.selectDone,
		this.defaultValueIndex,
		this.buttonTextStyle
	});

	showPickerDialog() async {
		final FixedExtentScrollController scrollController =
		FixedExtentScrollController(initialItem: defaultValueIndex ?? 0);

		await showCupertinoModalPopup<void>(
			context: ctx,
			builder: (BuildContext context) {
				return _buildBottomPicker(
					CupertinoPicker(
						scrollController: scrollController,
						itemExtent: _kPickerItemHeight,
						backgroundColor: CupertinoColors.white,
						onSelectedItemChanged: (int index) {
							defaultValueIndex = index;
						},
						children: List<Widget>.generate(dataSource.length, (int index) {
							return Center(child:
								Text(dataSource[index]),
							);
						}),
					),
				);
			},
		);
	}


	Widget _buildBottomPicker(Widget picker) {
		return Container(
			height: _kPickerSheetHeight+40,
			padding: const EdgeInsets.only(top: .0),
			color: CupertinoColors.white,
			child: DefaultTextStyle(
				style: const TextStyle(
					color: CupertinoColors.black,
					fontSize: 22.0,
				),
				child: GestureDetector(
					// Blocks taps from propagating to the modal sheet and popping.
					onTap: () {
					},
					child: SafeArea(
						top: false,
//						child: picker,
						child: Column(
							children: <Widget>[
								Container(
									height: 40,
									child: _pickerToolsBar(),
								),
								Expanded(
									child: picker,
								),
							],
						),
					),
				),
			),
		);
	}

	Widget _pickerToolsBar(){
		return Padding(
			padding: const EdgeInsets.symmetric(horizontal: 16),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					GestureDetector(
						onTap: (){
							Navigator.of(ctx).pop();
						},
						child: Text("取消",style: buttonTextStyle)
					),
					GestureDetector(
						onTap: (){
							selectDone(defaultValueIndex,dataSource[defaultValueIndex]);
							Navigator.of(ctx).pop();
						},
						child: Text("确定",style: buttonTextStyle)
					),
				],
			),
		);
	}
	
	
	/// 选择日期
	ValueChanged<DateTime> selectDate;
	static Future<void> pickDateOld(BuildContext context,ValueChanged<DateTime> selectDate) async {
		final DateTime picked = await showDatePicker(
			context: context,
			initialDate: DateTime.now(),
			firstDate: DateTime(2015, 8),
			lastDate: DateTime(2101)
		);
		selectDate(picked);
	}
	
	static Future<void> pickDate(BuildContext context,ValueChanged<DateTime> selectDate) async {
		DatePicker.showDatePicker(context,
			showTitleActions: true,
			onChanged: (date) {
			}, onConfirm: (date) {
				selectDate(date);
			},
			currentTime: DateTime.now(),
			minTime: DateTime(1930),
			locale: LocaleType.zh);
	}
	
	static Future<void> pickDateTime(BuildContext context,ValueChanged<DateTime> selectDate,{DateTime initTime}) async {
		cptn.DateTimePickerLocale _locale = cptn.DateTimePickerLocale.zh_cn;
		cptn.DatePicker.showDatePicker(
			context,
			minDateTime: DateTime(1930),
			initialDateTime: initTime==null?DateTime.now():initTime,
			dateFormat: 'yyyy年M月d日    EEE,H时:m分',
			locale: _locale,
//			pickerTheme: DateTimePickerTheme(
//				showTitle: _showTitle,
//			),
			pickerMode: cptn.DateTimePickerMode.datetime, // show TimePicker
			onCancel: () {
				debugPrint('onCancel');
			},
			onChange: (dateTime, List<int> index) {
			
			},
			onConfirm: (dateTime, List<int> index) {
				selectDate(dateTime);
			},
		);
	}
	
}
