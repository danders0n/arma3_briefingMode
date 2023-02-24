/*
 *	Author: D.Anderson
 *	Lorem
 *	
 *	Arguments:
 *	None
 *	
 *	Return Value:
 *	Structured Text
 *	
 *	Example:
 *	[] call dAn_fnc_hintTitle
 *	
 * 	Public: No
 */

// TODO: privates

_titleIntro = text "BreafingMode"; 
	_titleIntro setAttributes ["align", "left"];
	_titleIntro setAttributes ["color", "#fea80a"];
	_titleIntro setAttributes ["size", "1.5"];
	_titleIntro setAttributes ["font", "RobotoCondensedBold"];

_textTime = text "Briefing Time:";
	_textTime setAttributes ["align", "left"];
_formatedTime = [time-1, "M:SS"] call CBA_fnc_formatElapsedTime;
_str = [_formatedTime] joinString ":";
_time = text _str;
	_time setAttributes ["align", "right"];
	_time setAttributes ["font", "RobotoCondensedBold"];

//pushback to main array:
_returnIntro = composeText [
	_titleIntro, lineBreak,
	_textTime, _time, lineBreak,
	lineBreak, lineBreak
];

// return
_returnIntro;