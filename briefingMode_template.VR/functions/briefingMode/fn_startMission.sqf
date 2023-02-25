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
 *	[] call dAn_fnc_startMission
 *	
 * 	Public: No
 */

// TODO: privates

params[["_unit", player]];

_actionEH = _unit getVariable "briefingMode_actionEh";

[_unit, "blockThrow", "dAn_brefingMode", false] call ace_common_fnc_statusEffect_set;
[_unit, "DefaultAction", _actionEH] call ace_common_fnc_removeActionEventHandler;

_missionName = getMissionConfigValue "OnLoadName";
_missionAuthor = ["by", getMissionConfigValue "author"] joinString " ";

[ 
	[ 
		[_missionName, "align = 'left' shadow = '0' size = '1' font='PuristaBold'", "#ffffff"], 
		["", "<br/>"],
		[_missionAuthor, "align = 'left' shadow = '0' size = '0.75'", "#757575"]
	],
	safeZoneX/2, safeZoneH / 2
] spawn BIS_fnc_typeText2;