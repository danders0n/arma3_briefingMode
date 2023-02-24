/*
 *	Author: D.Anderson
 *	Lorem
 *	
 *	Arguments:
 *	None
 *	
 *	Return Value:
 *	Nothing
 *	
 *	Example:
 *	[] call dAn_fnc_displayHint
 *	
 * 	Public: No
 */

//waitUntil { [] call acre_api_fnc_isInitialized;};

_title = call dAn_fnc_hintTitle;
_radio = call dAn_fnc_hintRadio;
_group = call dAn_fnc_hintGroup;
_footer = text "Waiting for Admin to start the mission";
			_footer setAttributes ["color", "#999999"];

_structuredText = composeText [
	_title,
	_radio,
	_group,
	lineBreak,
	_footer
];

hintSilent _structuredText;

// return ?