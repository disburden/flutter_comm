import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

typedef finishSelect<I,T> = void Function(I idex,T value);

class FCPicker {
	final BuildContext ctx;
	final List<String> dataSource;
	final finishSelect<int,String> selectDone;

	TextStyle buttonTextStyle;

	int _selectedColorIndex=0;

	double _kPickerSheetHeight = 216.0;
	double _kPickerItemHeight = 32.0;
	FCPicker({
		@required this.ctx,
		@required this.dataSource,
		@required this.selectDone,
		this.buttonTextStyle
	});

	showPickerDialog() async {
		final FixedExtentScrollController scrollController =
		FixedExtentScrollController(initialItem: _selectedColorIndex);

		await showCupertinoModalPopup<void>(
			context: ctx,
			builder: (BuildContext context) {
				return _buildBottomPicker(
					CupertinoPicker(
						scrollController: scrollController,
						itemExtent: _kPickerItemHeight,
						backgroundColor: CupertinoColors.white,
						onSelectedItemChanged: (int index) {
							_selectedColorIndex = index;
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
							selectDone(_selectedColorIndex,dataSource[_selectedColorIndex]);
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
	
}
