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
 *	[_unit] call dAn_fnc_initBriefingMode
 *	
 * 	Public: No
 */

params[["_unit", player]];

[_unit] call dAn_fnc_disableWeapons;

["start", {
    missionNamespace setVariable ["dAn_brefingMode", true, true];
	["Weapons are live in 5 seconds"] remoteExec ["hintSilent"];

	[
		{
			private _unit = _this select 0;
			//systemchat str _unit;
			hintSilent "";
			[_unit] call dAn_fnc_startMission;
		},
		[_thisArgs],
		5
	] remoteExec ["CBA_fnc_waitAndExecute"];
}, "admin", _unit
] call CBA_fnc_registerChatCommand;

if (isClass(configfile >> "CfgWeapons" >> "ACRE_BaseComponent")) then {
	waitUntil { [] call acre_api_fnc_isInitialized;};
};

[
    {
		private _unit = ((_this getVariable "params") select 0);
		[] call dAn_fnc_displayHint;
		[] call dAn_fnc_updateRoster;
		//systemChat str _unit;
	},
    10,
    [_unit],
    {
		//systemChat format ["start!"];
		_test = 127;
	},
    { 
		//systemChat format ["end!"]
	},
    {true},
    {
		missionNamespace getVariable["dAn_brefingMode", false];
	},
    "_test"
] call CBA_fnc_createPerFrameHandlerObject;