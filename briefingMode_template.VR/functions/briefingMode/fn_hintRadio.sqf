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
 *	[] call dAn_fnc_hintRadio
 *	
 * 	Public: No
 */

_titleRadio  = text "Radios:",
	_titleRadio setAttributes ["align", "left"];
	_titleRadio setAttributes ["font", "RobotoCondensedBold"];

_arrRadio = [_titleRadio, lineBreak];
_returnRadio = "";

if (isClass(configfile >> "CfgWeapons" >> "ACRE_BaseComponent")) then {

	_radios = [] call acre_api_fnc_getMultiPushToTalkAssignment;

	if(count _radios == 0) then {
		_textRadio = text "No radios.";
		_textRadio setAttributes ["align", "left"];
		_arrRadio pushBack _textRadio;
		_arrRadio pushBack lineBreak;
	};
	// if not exited do this:
	{
		_radioName    = [_x] call acre_api_fnc_getDisplayName;
		_radioChannel = [_x] call acre_api_fnc_getRadioChannel;
		_chnLabel = "";

		if ([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf) then {
			_chnLabel = "N/A";
			_radioBlock = 1;
		
			for "_i" from 2 to 16 do {
				if ((_radioChannel/16 > (_i-1)) && (_radioChannel/16 <= _i)) exitWith {
					_radioBlock   = ((str((_radioChannel/16) + 1)) splitString ".") select 0;
					_radioBlock   = if ((_radioChannel % 16) == 0) then {
						((str((_radioChannel/16))) splitString ".") select 0;
					} else {
						((str((_radioChannel/16) + 1)) splitString ".") select 0;
					};
					_radioChannel = if ((_radioChannel % 16) == 0) then [{16}, {_radioChannel % 16}];
				};
			};
			
			_radioChannel = text (["B: ", _radioBlock, " - Chn: ", _radioChannel] joinString "");
			_radioChannel setAttributes ["align", "left"];
			_radioChannel setAttributes ["color", "#999999"];
		} else {
			_className    = [_x] call acre_api_fnc_getBaseRadio;
			_chnLabel = [_className, "default", _radioChannel, "description"] call acre_api_fnc_getPresetChannelField;
			_radioChannel = text (["Chn: ", _radioChannel] joinString "");
			_radioChannel setAttributes ["align", "left"];
			_radioChannel setAttributes ["color", "#999999"];
		};
		_radioPPT = str (_forEachIndex + 1);
		_radioSpatial = [_x] call acre_api_fnc_getRadioSpatial;
		_radioSpacialLetter = (_radioSpatial splitString "") select 0;

		//set atrbs
		_radioName = text ([_radioName, ": "] joinString "");
			_radioName setAttributes ["align", "left"];
		/*
		_radioChannel = text (["Chn: ", _radioChannel] joinString "");
			_radioChannel setAttributes ["align", "left"];
			_radioChannel setAttributes ["color", "#999999"];
		*/
		_chnLabels = text _chnLabel;
			_chnLabels setAttributes ["align", "right"];
		_radioPPT = text ([" - ", _radioPPT] joinString "");
			_radioPPT setAttributes ["align", "right"];
			_radioPPT setAttributes ["color", "#999999"];
		_radioSpacialLetter = text ([", ", _radioSpacialLetter] joinString "");
			_radioSpacialLetter setAttributes ["align", "right"];
			_radioSpacialLetter setAttributes ["color", "#999999"];

		//push line to main array
		_arrRadio pushBack _radioName;
		_arrRadio pushBack _radioChannel;
		_arrRadio pushBack _chnLabels;
		_arrRadio pushBack _radioPPT;
		_arrRadio pushBack _radioSpacialLetter;
		_arrRadio pushBack lineBreak;

	} forEach _radios;

	_arrRadio pushBack lineBreak;
	_arrRadio pushBack lineBreak;
	_returnRadio = composeText _arrRadio;
} else {
	_arrRadip pushBack "TFAR is not supported";
	_arrRadio pushBack lineBreak;
	_arrRadio pushBack lineBreak;
	_returnRadio = composeText _arrRadio;
};

// return
_returnRadio;